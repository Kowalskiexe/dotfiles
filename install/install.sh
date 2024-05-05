#!/usr/bin/env bash

is_stdout() {
    [ -t 1 ]
}

log() {
    COLOR="1;35"  # 1;33 is light purple
    if is_stdout ; then
        echo -e "\e[${COLOR}m[log]: $1\e[0m"
    else
        echo "[log]: $1"
    fi
}

help() {
    echo "Usage: install.sh STAGE [DISK]"
    echo "Install preconfigured Arch Linux on DISK."
    echo "STAGE can be either prechroot or postchroot"
    echo
    echo "If STAGE is prechroot then a proper disk device must be provided as the second argument."
    echo "e.g. install.sh prechroot /dev/sda"
}

setup_pacman() {
    # update keyrings to latest to prevent packages failing to install
    pacman-key --init
    pacman-key --populate archlinux
    pacman -Sy --noconfirm archlinux-keyring
    pacman -S --noconfirm --needed pacman-contrib
}

partition_disk() {
    # --script -- never prompt for interaction
    # -a optimal -- align partions 'optimally'
    parted --script -a optimal $1 \
        mklabel gpt \
        mkpart efi fat32 1MiB 1025MiB \
        set 1 esp on \
        mkpart linux btrfs 1025MiB 100%
}

make_filesystems() {
    pacman -S --noconfirm btrfs-progs

    mkfs.fat -F 32 "$1"1
    # -L label -- specify a label for the filesystem
    # -f -- force
    mkfs.btrfs -L linux "$1"2 -f
    mount -t btrfs "$1"2 /mnt
    btrfs subvolume create /mnt/@
    btrfs subvolume create /mnt/@home
    btrfs subvolume create /mnt/@var
    btrfs subvolume create /mnt/@tmp
    btrfs subvolume create /mnt/@.snapshots
    umount /mnt

    # no swap
}

mount_partitions() {
    mount -o subvol=@ "$1"2 /mnt
    mount --mkdir -o subvol=@home "$1"2 /mnt/home
    mount --mkdir -o subvol=@tmp "$1"2 /mnt/tmp
    mount --mkdir -o subvol=@var "$1"2 /mnt/var
    mount --mkdir -o subvol=@.snapshots "$1"2 /mnt/.snapshots
    mount --mkdir "$1"1 /mnt/boot
}

install_base() {
    # -K -- Initialize an empty pacman keyring in the target (implies -G).
    # -G -- Avoid copying the host’s pacman keyring to the target.
    pacstrap -K /mnt base linux linux-firmware vim networkmanager man-db
}

prechroot_stage() {
    # Update system clock
    timedatectl set-ntp true
    log "Time now: $(date)"
    setup_pacman
    ## Prepare the file system
    umount -R /mnt
    # Partition disks
    log "Partitioning disk $1"
    partition_disk "$1"
    log "$1 partitioned"
    log "Creating files system"
    make_filesystems "$1"
    mount_partitions "$1"
    log "Partitions mounted"

    log "Install essential packages..."
    install_base
    log "Done installing essential packages"

    # -U -- Use UUIDs for source identifiers (shortcut for -t UUID).
    genfstab -U /mnt >> /mnt/etc/fstab

    # copy this script into chroot directory
    cp "$(pwd)/$0"  /mnt/install.sh
    # proceed to postchroot stage
    exec arch-chroot /mnt /install.sh postchroot
}

generate_locale() {
    echo -e 'en_US.UTF-8 UTF-8\npl_PL.UTF-8 UTF-8' > /etc/locale.gen
    locale-gen
    echo 'LANG=en_US.UTF-8' > /etc/locale.conf
}

install_bootloader() {
    pacman -S --noconfirm grub efibootmgr
    grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
    grub-mkconfig -o /boot/grub/grub.cfg
}

postchroot_stage() {
    systemctl enable NetworkManager

    ## Time
    # set time zone
    ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
    log "Set timezone to Europe/Warsaw"
    # generate /etc/adjtime
    log "Generate /etc/adjtime"
    hwclock --systohc

    log "Generating locales"
    generate_locale

    # set keyboard layout
    echo 'KEYMAP=pl' > /etc/vconsole.conf

    echo 't470' > /etc/hostname

    # Default root password
    echo "root" | passwd root --stdin

    log "Installing bootloader"
    install_bootloader

    log "Done! Now try rebooting"
    exec /bin/bash
}


# Verify the boot mode
cat /sys/firmware/efi/fw_platform_size > /dev/null || (log "Error! Not in EFI boot mode."; exit 3)
# Should output 64 if booted in UEFI mode and has a 64-bit x64 UEFI.

# Print help
if [[ "$1" == "" ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    help
    exit 0
fi
# Verify arguments
if [[ "$1" != prechroot ]] && [[ "$1" != postchroot ]]; then
    log "Error! Provide proper STAGE!"
    help
    exit 1
fi
if [[ "$1" == prechroot ]]; then
    if ! [[ "$2" =~ ^/dev/ ]]; then
        log "Error! Proper proper DISK"
        help
        exit 2
    fi
    prechroot_stage "$2"
fi
if [[ "$1" == postchroot ]]; then
    postchroot_stage
fi


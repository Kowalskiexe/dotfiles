# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
      <nixos-hardware/lenovo/thinkpad>
    ];
 
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  systemd.services.dlm.wantedBy = [ "multi-user.target" ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  i18n.supportedLocales = [
      "C.UTF-8/UTF-8"
      "en_US.UTF-8/UTF-8"
      "pl_PL.UTF-8/UTF-8"
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.extraModulePackages = with config.boot.kernelPackages; [
    evdi
  ];

  networking.hostName = "x1"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

  services.fwupd.enable = true;

  services.hardware.bolt.enable = true;

  # services.pgadmin = {
  #   enable = true;
  #   minimumPasswordLength = 0;
  #   initialEmail = "kowalski.exe@gmail.com";
  #   initialPasswordFile = "/dev/null";
  # };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  documentation.dev.enable = true; # install man pages

  hardware = {
    spacenavd.enable = true;
    i2c.enable = true;
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-compute-runtime
        intel-media-driver
      ];
    };
    bluetooth = {
      enable = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  networking.extraHosts =
  ''
    127.0.0.1 mbp
    127.0.0.1 my.matrix.host
  '';

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = false;
  services.xserver.videoDrivers = [ "displaylink" ];
  # services.xserver.displayManager.gdm = {
  #   enable = true;
  #   wayland = true;
  # };
  # services.displayManager.enable = false;
  # services.displayManager.ly.enable = true;
  # services.displayManager.sddm = {
  #   enable = true;
  #   # theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  #   wayland.enable = true;
  # };
  services.blueman.enable = true;
  services.flatpak.enable = true;
  services.gvfs.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.tailscale.enable = true;

  services.onedrive.enable = true;

  services.syncthing.enable = true;

  services.kanata = {
    enable = true;
    keyboards = {
      "default".config = ''
(defsrc
  grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
  tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
  caps a    s    d    f    g    h    j    k    l    ;    '    ret
  lsft z    x    c    v    b    n    m    ,    .    /    rsft
  lctl lmet lalt           spc            ralt rmet rctl
)

(deflayer default
  grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
  tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
  esc a    s    d    f    g    h    j    k    l    ;    '    ret
  lsft z    x    c    v    b    n    m    ,    .    /    rsft
  lctl lmet lalt           spc            ralt rmet rctl
)
  '';
    };
  };

  

  # Configure keymap in X11
  services.xserver.xkb.layout = "pl";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  security.rtkit.enable = true;
  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    # pulse.enable = true;
    jack.enable = true;
  };


  programs.virt-manager.enable = true;

  # Enable common container config files in /etc/containers
  virtualisation = {
    containers.enable = true;
    libvirtd = {
      enable = true;
    };
    spiceUSBRedirection.enable = true;
    podman = {
      enable = false;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
    docker = {
      enable = true;
      storageDriver = "btrfs";
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.inter = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "uinput" "docker" "libvirtd"]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = [
      # yeah, that's my public key
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILc/IQW+eGrh1MWxi86PxrIVcKjNj/udTuMWhq/lCuy/ kowalski.exe@gmail.com"
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    neovim
    curl
    wget
    firefox
    mako
    libnotify
    eww
    wofi
    kitty
    git
    zip
    unzip
    fish
    nushell
    libgcc
    gcc
    zlib
    linuxKernel.packages.linux_xanmod.tp_smapi  # ThinkPad only
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    (python3.withPackages(ps: with ps; [ numpy setuptools ]))
    kotlin
    gradle
    psmisc
    arp-scan
    usbutils
    jmtpfs
    glib
    podman-tui
    docker-compose
    dconf
    linux-wifi-hotspot
    tmux
    libva-utils
    xwayland
    networkmanagerapplet
    clang
    bottles
    atuin
    zoxide
    gnupg
    pinentry-all
    virtualglLib
    rpi-imager
    hyprpolkitagent
  ];
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
  environment.variables = {    
    WLR_EVDI_RENDER_DEVICE = "/dev/dri/card1";                                                                                                   
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  programs.fish.enable = true;
  security.polkit.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.java.enable = true;

  security.pam.services.swaylock = {};

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}


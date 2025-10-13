{ config, pkgs, ... }:
let
  stable = import <nixos-24.05> {
    config = config.nixpkgs.config;
  };
in

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "inter";
  home.homeDirectory = "/home/inter";

  # fonts.fontconfig.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.cmatrix
    pkgs.aerc
    # pkgs.syncthing
    pkgs.blender
    pkgs.git-standup
    pkgs.inxi
    pkgs.klavaro
    pkgs.yt-dlp
    pkgs.syncthingtray
    pkgs.cmake
    pkgs.nodejs_22
    pkgs.yarn-berry
    pkgs.cargo
    pkgs.spotify
    pkgs.keepassxc
    pkgs.libgcc
    pkgs.google-chrome
    pkgs.electron
    pkgs.webcord
    pkgs.pyprland
    pkgs.swww
    pkgs.fcitx5
    pkgs.brightnessctl
    pkgs.fish
    pkgs.dotacat  # faster lolcat, it indeed is noticeably faster
    pkgs.cowsay
    pkgs.neofetch
    pkgs.bat
    pkgs.starship
    pkgs.ripgrep
    pkgs.gh
    pkgs.fzf
    pkgs.jetbrains-mono
    pkgs.sqlitebrowser
    pkgs.grimblast
    pkgs.wev
    pkgs.fortune-kind
    pkgs.pywal
    pkgs.socat
    pkgs.jq
    pkgs.udiskie
    pkgs.kdePackages.polkit-kde-agent-1
    pkgs.swayidle
    pkgs.bluez
    pkgs.blueman
    pkgs.playerctl
    pkgs.zathura
    pkgs.sioyek
    pkgs.pdfgrep
    pkgs.texliveFull
    pkgs.xdotool
    pkgs.signal-desktop-bin
    pkgs.gimp
    pkgs.neovide
    pkgs.obsidian
    pkgs.libreoffice
    pkgs.cloc
    pkgs.wl-clipboard
    pkgs.ruff
    pkgs.btop
    pkgs.pnpm
    pkgs.prismlauncher
    pkgs.poppler_utils
    pkgs.graphviz
    pkgs.pavucontrol
    pkgs.mpv
    pkgs.conda
    pkgs.file
    pkgs.vscode
    pkgs.slack
    pkgs.anki
    pkgs.android-file-transfer
    pkgs.gnumake
    pkgs.php
    pkgs.google-cloud-sdk
    # pkgs.godot
    pkgs.cpufetch
    pkgs.code-cursor
    pkgs.quarto
    pkgs.teams-for-linux
    pkgs.htop
    pkgs.luajitPackages.luarocks
    pkgs.stow
    pkgs.acpi
    pkgs.calibre
    pkgs.zellij
    pkgs.qbittorrent
    pkgs.rust-analyzer
    pkgs.heroic
    pkgs.linux-router
    pkgs.lsof
    pkgs.macchanger
    pkgs.p7zip
    pkgs.cabextract
    pkgs.wine
    pkgs.winetricks
    pkgs.yad
    pkgs.mokutil
    pkgs.gettext
    pkgs.lsb-release
    pkgs.bc
    pkgs.xorg.xrandr
    pkgs.xorg.xhost
    pkgs.blender
    pkgs.ffmpeg
    pkgs.hypridle
    pkgs.openssl
    pkgs.fastfetch
    pkgs.gdown
    pkgs.pdftk
    pkgs.qpdf
    pkgs.ddcutil
    pkgs.live-server
    pkgs.hyprsome
    pkgs.pkg-config
    pkgs.meson
    pkgs.android-tools
    pkgs.trivy
    pkgs.bear
    pkgs.stdmanpages
    pkgs.man-pages
    pkgs.man-pages-posix
    pkgs.xh
    pkgs.trayscale
    # pkgs.rstudio
    pkgs.R
    pkgs.go
    pkgs.sqls
    pkgs.ngspice  # for uni
    pkgs.usbimager
    pkgs.woeusb
    pkgs.wireshark
    pkgs.arduino
    pkgs.sonar-scanner-cli
    pkgs.gti
    pkgs.claude-code
    pkgs.jellyfin
    pkgs.jellyfin-web
    pkgs.koreader
    pkgs.eza  # better ls
    pkgs.fd # better find, dependency for pyamble nvim plugin
    pkgs.grip-grab # dependency for pyamble nvim plugin
    pkgs.basedpyright # python lsp
    pkgs.lua-language-server # lua lsp
    pkgs.yaml-language-server # yaml lsp
    pkgs.lan-mouse
    pkgs.ollama
    # pkgs.aider-chat-with-playwright
    pkgs.tealdeer  # tldr
    pkgs.timer  # sleep with progress bar
    pkgs.typst
    pkgs.element-desktop
    pkgs.traceroute
    pkgs.marp-cli
    pkgs.prometheus-node-exporter
    pkgs.ethtool
    pkgs.kdePackages.kdenlive
    pkgs.nmap
    pkgs.git-quick-stats
    # pkgs.kicad
    pkgs.timewall
    pkgs.ghostty
    pkgs.albert
    pkgs.most
    # pkgs.google-cloud-sdk
    pkgs.azure-cli
    pkgs.k9s
    # pkgs.jetbrains.datagrip  # god bless student's license
    pkgs.mkcert
    pkgs.caddy
    pkgs.nss
    pkgs.dig
    pkgs.inetutils
    pkgs.nms
    pkgs.postgresql
    pkgs.gitleaks
    pkgs.ghostty
    pkgs.imagemagick


    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/inter/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  services.mpris-proxy.enable = true;
  services.syncthing.enable = true;

    # qt.enable = true;
    # qt.platformTheme.name = "gtk";
    # qt.style.name = "adwaita-dark";

  gtk.enable = true;
  gtk.cursorTheme.name = "Notwaita-Black";
  gtk.theme.name = "adwaita-dark";

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.yazi.enable = true;

  programs.hyprlock.enable = true;

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

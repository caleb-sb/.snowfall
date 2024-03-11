# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_ZA.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.caleb = {
    isNormalUser = true;
    description = "Caleb";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "caleb";
  services.pipewire = {
      enable = true;
      alsa.enable = true;
      audio.enable = true;
      pulse.enable = true;
#      jack.enable = true;
    };
  services.blueman.enable = true;
  services.printing.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.hyprland.enable = true;
  programs.fish.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  fonts.fontconfig.defaultFonts = {
    monospace = [ "JetBrainsMono Nerd Font" ];
    serif = [ "FreeSerif" ];
    sansSerif = [ "FreeSans" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bat # A better cat
    blueman # A GTK Bluetooth manager
    bluez
    bluez-tools
    brave # Browser
    brightnessctl # Brightness control
    cargo
    cliphist
    corepack
    dolphin # File browser
    dunst # Notifications
    eza # A better ls -a
    firefox
    git
    go
    google-chrome
    grimblast # Screenshots
    hyprpicker
    imagemagick
    jq # Json processing
    kanshi # Multi monitor setup
    kitty
    kitty-themes
    lazygit # literally me
    less # Cant remember what uses this by default
    libgcc
    libsForQt5.ark
    # libsForQt5.ffmpegthumbs
    # libsForQt5.kde-cli-tools
    # libsForQt5.polkit-kde-agent
    # libsForQt5.qt5.qtimageformats
    # libsForQt5.qt5.qtwayland
    # libsForQt5.qt5.qtquickcontrols
    # libsForQt5.qt5.qtquickcontrols2
    # libsForQt5.qt5.qtgraphicaleffects
    # libsForQt5.qt5ct
    meld # compare files
    networkmanagerapplet # The thing in the tray
    nodejs_20
    nwg-look
    obs-studio # For my vanity
    pamixer
    parallel
    pavucontrol
    prettierd # For my code vanity
    python3
    # qt6.qtwayland
    ripgrep # Faster grep
    wofi # Fancy dmenu
    # sddm # Login
    slurp
    spotify
    starship # Terminal prompt
    swappy
    swaylock-effects
    swww
    tree
    tree-sitter # for nvim
    unzip # those pants
    usbimager # mintstick
    wget
    wireplumber
    wl-clip-persist
    wl-clipboard
    wlogout
    xdg-desktop-portal-hyprland
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}


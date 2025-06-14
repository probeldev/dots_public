# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, fastlauncher, niri-screen-time, unsplashwall, fastlauncher-niri-windows, ... }: 
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];



  # Bootloader.

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };


  boot.kernelParams = [ "thinkpad_acpi.fan_control=1" ];

  zramSwap.enable = true;


  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking = {
            networkmanager = {
	        enable = true;
                enableStrongSwan = true;
                plugins = [
                    pkgs.networkmanager-l2tp
                    pkgs.networkmanager_strongswan
                ];
            };
        };
  services.strongswan = {
                enable = true;
                secrets = [
                    "ipsec.d/ipsec.nm-l2tp.secrets"
                ];
            };

  # Set your time zone.
  time.timeZone = "Europe/Minsk";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  #services.displayManager.ly.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  #programs.hyprland.enable = true;
  programs.niri.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security = {
  	rtkit.enable = true;
	sudo.enable = false;
	    sudo-rs = {
	      enable = true;
	      execWheelOnly = true;
	      wheelNeedsPassword = true;
	    };
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sergey = {
    isNormalUser = true;
    description = "sergey";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };


  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     linuxKernel.packages.linux_zen.cpupower

     neovim     
     helix
     tree
     superfile
     lazygit

     dbgate

     go
     gopls
     golangci-lint
     golangci-lint-langserver


     nodejs
     vtsls
     jq
     nodePackages.prettier
     gcc

     sshuttle

     tdesktop
     chromium

     pfetch
     foot
     ghostty
     waybar
     git
     btop

     gdu # disk usage

     hyprlock
     hyprcursor
     wl-clip-persist
     thinkfan
     lm_sensors

     bibata-cursors
     wl-clipboard
     clipman     

     networkmanagerapplet

     emacs-pgtk
     
     cmake
     emacsPackages.vterm

     ghostty

     nautilus 
     totem
     papers
     loupe
     snapshot
     gnome-text-editor
     epiphany
     fragments
     gnome-calendar
     foliate
     mission-center
     pavucontrol
     file-roller

     xwayland-satellite
     anydesk

     musicpod
     adwaita-icon-theme
     gsettings-desktop-schemas
     swappy
     gammastep
     brightnessctl

     swaybg
     #swayidle
     hypridle
     swayosd
     libnotify
     swaynotificationcenter

     dialect

     wget
     ripgrep

     xorg.xmodmap

     fastlauncher.packages.${system}.default
     niri-screen-time.packages.${system}.default
     unsplashwall.packages.${system}.default
     fastlauncher-niri-windows.packages.${system}.default


     wf-recorder
     ffmpeg
     fzf

     dnsutils
     whois

     docker-compose

     libreoffice
  ];

fonts.packages = with pkgs; [
   nerd-fonts.fira-code
];

# for global user
users.defaultUserShell=pkgs.zsh; 

# For a specific user
users.users.sergey.shell = pkgs.zsh; 
# users.users.officialrajdeepsingh.shell = pkgs.zsh;

services.gnome.gnome-keyring.enable = true;

hardware.bluetooth.enable = true; # enables support for Bluetooth
hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

services.blueman.enable = true;


# enable zsh and oh my zsh
programs = {
   zsh = {
      enable = true;
      autosuggestions.enable = true;
      # zsh-autoenv.enable = true;
      # syntaxHighlighting.enable = true;
      ohMyZsh = {
         enable = true;
         # theme = "robbyrussell";
         theme = "mortalscumbag";
         plugins = [
	   "fzf"
           "git"
           "npm"
           "history"
           "node"
           "rust"
           "deno"
         ];
      };
   };
};

services.gvfs.enable = true; # for nautilus

programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};



services.flatpak.enable = true;

    programs.nix-ld = {
      enable = true;
      libraries =
        (pkgs.steam-run.args.multiPkgs pkgs)
        ++ (with pkgs; [
          xorg.libxkbfile
          icu
        ]);
    };


    nix.settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };

services.cron = {
    enable = true;
};


virtualisation.docker.enable = true;



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

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
  system.stateVersion = "24.11"; # Did you read the comment?

}

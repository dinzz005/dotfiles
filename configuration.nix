# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  boot.kernelParams = [
     "acpi_backlight=native"
     "quiet"
     "loglevel=0"
     "systemd.show_status=false"
     "rd.udev.log_level=0"
     "udev.log_priority=0"
     "vt.global_cursor_default=0"
   ];
  
  networking.hostName = "nixos-btw"; # Define your hostname.
   

  nix.settings = {
      substituters = [
          "https://cache.nixos.org"
	  "https://niri.cachix.org"
	  "https://noctalia.cachix.org"
      ]; 

      trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];

  };
  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };
  services.fwupd.enable = true; 
  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  #  services.xserver = {
  #   enable = true;
  #};

  # asus services enabled
  services = {
     asusd = {
       enable = true;
       enableUserService = true;
     };
  };
  #dark mode enabling 
  programs.dconf.enable = true;

  # gtk portal support
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
     config = {
       common.default = [ "gtk" ];
     };
  }; 


  # Bluetooth settings
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Optional: Enable experimental features (e.g., battery level for headsets)
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
  };
 
 services.upower.enable = true;
  # graphics driver settings
  services.xserver.videoDrivers = ["nvidia"];
  hardware.graphics = {
      enable = true;
  };

  hardware.nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      prime = {
         offload = {
	    enable = true;
	    enableOffloadCmd = true;
	 };
	 amdgpuBusId = "PCI:5:0:0";
	 nvidiaBusId = "PCI:1:0:0";
      };
  };


  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
      nerd-fonts.fira-code
  ];

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.dinzz = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
     shell = pkgs.fish;
   };

   # programs.firefox.enable = true;
   programs.niri.enable = true;
   programs.fish.enable = true;
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
   environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     neovim
     btop
     fastfetch
     git
     brightnessctl
     kitty
     stow
     swaybg
     yazi
     nemo
     fuzzel
     ashell
     # for dark theme
     adwaita-icon-theme
     gnome-themes-extra
     papirus-icon-theme
     bibata-cursors

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
   services.openssh = {
  	enable = true;
  	settings = {
	    PasswordAuthentication = true;
    	    PermitRootLogin = "no";
        };
    };  

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

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
  system.stateVersion = "26.05"; # Did you read the comment?

}


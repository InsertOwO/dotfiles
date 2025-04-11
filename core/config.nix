# Options that I want on all my used pc's are set here.

{inputs, pkgs, ...}:

{
  boot = {
    # Configure the bootloader.config
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        splashImage = ../assets/grub.png;
        font = ../assets/SourceCodePro.ttf;
        fontSize = 25;
      };
    };

    # Make booting up more smooth.
    plymouth.enable = true;
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    # Because NixOS doesn't ship with the lastest lts?
    kernelPackages = pkgs.linuxKernel.packages.linux_6_12;
  };

  # Set Some variables.
  environment.variables = {
    TERMINAL = "foot";
    TERM = "foot";
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "nvim";
    FILE = "nnn";
    NIXOS_OZONE_WL=1;
  };

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Define main user account.
  users.users.insert = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
  };

  # Extra man pages.
  documentation.dev.enable = true;

  # Set homemanager for main user.
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      insert = import ../home/insert.nix;
    };
  };

  # Manage Nix.
  nix = {
    # Enable flakes.
    settings.experimental-features = [
      "nix-command"
      "flakes"
	  ];

    # Optimise the Nix store.
    optimise.automatic = true;

    # Garbage collector stuff.
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # Import home-manager and the basic needed desktop apps.
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../modu/apps-base.nix
  ];

  # You are too stupid to know what this number means so just dont change it. Okay?
  system.stateVersion = "24.11";
}

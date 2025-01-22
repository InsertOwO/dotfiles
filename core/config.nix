# Options that I want on all my used pc's are set here.

{inputs, config, pkgs, ...}:

{
  boot = {
    # Configure the bootloader.
    loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    };

    # Because NixOS doesn't ship with the lastest lts?
    kernelPackages = pkgs.linuxKernel.packages.linux_6_12;
  };

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Define main user account.
  users.users.insert = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

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
  imports = [inputs.home-manager.nixosModules.home-manager ../modu/apps-base.nix];

  # You are too stupid to know what this number means so just dont change it. Okay?
  system.stateVersion = "24.11";
}

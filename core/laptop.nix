{inputs, config, pkgs, ...}:

{
  # Enable networking.
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  # Activate school user.
  users.users.school = {
    isNormalUser = true;
    packages = with pkgs; [libreoffice];
  };

  # Activate home-manager for school user.
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      school = import ../home/school.nix;
    };
  };

  # Import stuff.
  imports = [./hw/hw-laptop.nix ./config.nix];
}

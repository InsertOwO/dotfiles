{inputs, pkgs, ...}:

{
  # Enable networking.
  networking = {
    hostName = "luna";
    networkmanager.enable = true;
  };

  # Activate school user.
  users.users.school = {
    isNormalUser = true;
    packages = with pkgs; [libreoffice geogebra6];
  };

  # Activate bluetooth.
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Activate home-manager for school user.
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      school = import ../../home/school.nix;
    };
  };

  # Import stuff.
  imports = [./hw-luna.nix ../config.nix];
}

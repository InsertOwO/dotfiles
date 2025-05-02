{inputs, pkgs, ...}:

{
  # Enable networking.
  networking = {
    hostName = "luna";
    networkmanager.enable = true;
  };

  # Enable school user.
  users.users.school = {
    isNormalUser = true;
    packages = with pkgs; [libreoffice geogebra6];
  };

  # Enable bluetooth.
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Enable home-manager for school user.
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      school = import ../../home/school.nix;
    };
  };

  # Import stuff.
  imports = [
    ../config.nix
    ./hw-luna.nix

    # Change to sway.nix for sway.
    ../../modu/hypr.nix
  ];
}

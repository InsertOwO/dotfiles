{config, pkgs, ...}:

{
  name = "school";

  home = {
    username = "${config.name}";
    homeDirectory = "/home/${config.name}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;

  imports = [./share.nix];
}

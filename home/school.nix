{config, ...}:

{
  name = "school";

  home = {
    username = "${config.name}";
    homeDirectory = "/home/${config.name}";
    stateVersion = "24.11";
  };

  color = {
    priCol = "d33682";
    secCol = "6c71c4";
    warnCol = "dc322f";
    bgCol = "002b36";
    txtCol = "93a1a1";
  };

  programs.home-manager.enable = true;

  imports = [./share.nix];
}

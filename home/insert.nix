{config, pkgs, ...}:

{
  name = "insert";

  home = {
    username = "${config.name}";
    homeDirectory = "/home/${config.name}";
    stateVersion = "24.11";
  };

  color = {
    priCol = "fc83bb";
    secCol = "cb83fc";
    bgCol = "150526";
    txtCol = "ffffff";
  };

  programs = {
    home-manager.enable = true;
  };

  imports = [
    ./share.nix
    ../modu/apps-code.nix
  ];
}

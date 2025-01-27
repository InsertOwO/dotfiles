{config, ...}:

{
  # My name.
  name = "insert";

  # Let home-mananager know who I am.
  home = {
    username = "${config.name}";
    homeDirectory = "/home/${config.name}";
    stateVersion = "24.11";
  };

  # Set colors my wm.
  color = {
    priCol = "f4b8e4";
    secCol = "babbf1";
    bgCol = "292c3c";
    txtCol = "c6d0f5";
  };

  # Let home-manager manager itself.
  programs = {
    home-manager.enable = true;
  };

  # Import needed settings and modules.
  imports = [
    ./share.nix
    ../modu/apps-code.nix
  ];
}

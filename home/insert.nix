{ config, ...}:

{
  # My name.
  name = "insert";

  # Let home-mananager know who I am.
  home = {
    username = "${config.name}";
    homeDirectory = "/home/${config.name}";
    stateVersion = "24.11";
  };

  # Set colors for my wm.
  color = {
    priCol = "f4b8e4";
    secCol = "babbf1";
    bgCol = "292c3c";
    txtCol = "c6d0f5";
  };

  programs = {
    # Let home-manager manager itself.
    home-manager.enable = true;

    # Shell Aliases.
    bash = {
#      enable = true;
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake ~/system";
        s = "cd ~/system && git add *";
        luna = "s && rebuild#luna";
        fujin = "rebuild#fujin";
        fetch = "fastfetch";
        queer = "hyfetch";
      };
    };
  };

  # Import needed settings and modules.
  imports = [
    ./share.nix
    ../modu/apps-code.nix
  ];
}

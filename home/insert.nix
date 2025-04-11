{config, pkgs, ...}:

{
  # My name.
  name = "insert";

  # Let home-mananager know who I am.
  home = {
    username = "${config.name}";
    homeDirectory = "/home/${config.name}";
    stateVersion = "24.11";
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-frappe-pink-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        size = "standard";
        variant = "frappe";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "frappe";
        accent = "pink";
      };
    };
  };

  programs = {
    # Let home-manager manager itself.
    home-manager.enable = true;

    # Shell Aliases.
    bash = {
#      enable = true;
      package = null;
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

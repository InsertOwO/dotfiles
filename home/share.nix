{lib, ...}:

{
  imports = [../modu/wm/sway.nix];

  options = {
    # This is just so I can get the icon from .local in waybar.
    name = lib.mkOption {example = "insert";};

    # Colors that the wm will be themed with.
    color = {
      priCol = lib.mkOption {default = "841a1c";};
      secCol = lib.mkOption {default = "411a84";};
      bgCol = lib.mkOption {default = "150526";};
      txtCol = lib.mkOption {default = "ffffff";};
    };
  };
}

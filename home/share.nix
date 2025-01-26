{lib, ...}:

{
  # Import my wm so it's applied to both users
  imports = [../modu/wm/sway.nix];

  # Set some options.
  options = {
    # This is just so I can get the icon from .local in waybar.
    name = lib.mkOption {example = "insert";};

    # Colors that the wm will be themed with.
    color = {
      priCol = lib.mkOption {default = "b7000c";};
      secCol = lib.mkOption {default = "ff0206";};
      bgCol = lib.mkOption {default = "150526";};
      txtCol = lib.mkOption {default = "ffffff";};
    };
  };
}

{lib, ...}:

{
  # Import my wm so it's applied to both users
  imports = [../modu/wm/wm.nix];

  config.xdg.portal = {
    enable = true;
    config.common.default = "*";
  };

  # Set some options.
  options = {
    # This is just so I can get the icon from .local in waybar.
    name = lib.mkOption {example = "insert";};

    # Colors that the wm will be themed with.
    color = {
      priCol = lib.mkOption {default = "f4b8e4";};
      secCol = lib.mkOption {default = "ca9ee6";};
      warnCol = lib.mkOption {default = "e78284";};
      bgCol = lib.mkOption {default = "303446";};
      txtCol = lib.mkOption {default = "c6d0f5";};
    };
  };
}

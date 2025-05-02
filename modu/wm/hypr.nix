{config, pkgs, ...}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    settings = {
      "$mod" = "SUPER";

      "$menu" = "${pkgs.rofi-wayland}/bin/rofi -show drun";
      "$term" = "foot";
      "$browse" = "firefox";
      "$file" = "foot -e nnn";

      general = {
        gaps_out = 10;
        border_size = 3;
        "col.active_border" = "rgb(${config.color.priCol})";
        "col.inactive_border" = "rgb(${config.color.bgCol})";
        resize_on_border = true;
      };

      decoration.rounding = 10;

      exec-once = [
        "waybar"
      ];

      input = {
        kb_layout = "us,be";
        kb_option = "swapescape,";
      };

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"

        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];
      bind = [
        # Launch and kill apps
        "$mod, d, exec, $menu"
        "$mod, q, exec, $term"
        "$mod, w, exec, $file"
        "$mod, e, exec, $browse"        
        "$mod, c, killactive"
        "$mod, escape, exec, wlogout"        
        "$mod, a, togglefloating"
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"
        "$mod, f, fullscreen"

        ", print, screenshot region"
        "shift, print, screenshhot window"
        "$mod, print, screenshot screen"

        "$mod shift, h, movewindow, l"
        "$mod shift, l, movewindow, r"
        "$mod shift, k, movewindow, u"
        "$mod shift, j, movewindow, d"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
    };
  };
}

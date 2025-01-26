{config, pkgs, ...}:
let
  # Set the modifier key.
  mod = "Mod4";
in
{
  wayland.windowManager.sway = {
    # Let home-manager configure sway
    enable = true;
    package = null;
    config = {
      # Set the wallpaper.
      output."*".bg = "~/.local/wallpaper.png fill";

      # Set the gaps.
      gaps = {
        inner = 7;
        smartBorders = "no_gaps";
      };

      # Disable window titlebars and set the border.
      window = {
        border = 3;
        titlebar = false;
      };
      floating = {
        titlebar = false;
        modifier = "${mod} normal";
      };

      # Set the colors to the ones set in home.
      colors.focused = {
        background = "#${config.color.bgCol}";
        border = "#${config.color.priCol}";
        childBorder = "#${config.color.priCol}";
        indicator = "#${config.color.secCol}";
        text = "#${config.color.txtCol}";
      };

      # Set waybar as the status bar.
      bars = [
        {
          command = "${pkgs.waybar}/bin/waybar";
          position = "top";
        }
      ];

      # Open workspace 1 by default.
      defaultWorkspace = "workspace number 1";

      # Set the keyboard layout and set caps to escape.
      input."*" = {
        xkb_layout = "us,be";
        xkb_options = "caps:escape";
      };

      # Set keybindings to follow QWERTY.
      bindkeysToCode = true;
      keybindings = {
        # Launch and kill apps.
        "${mod}+d" = "exec rofi -show drun";
        "${mod}+Return" = "exec ${pkgs.foot}/bin/foot";
        "${mod}+b" = "exec firefox";
        "${mod}+f" = "fullscreen toggle";
        "${mod}+r" = "mode resize";
        "${mod}+Shift+q" = "kill";

        "${mod}+Escape" = "exec wlogout";
	      "${mod}+Shift+r" = "reload";
        "${mod}+BackSpace" = "input * xkb_switch_layout next";

        # Take screenshots.
        "Print" = "exec screenshot region";
        "Print+Shift" = "exec screenshot window";
        "Print+Ctrl" = "exec screenshot output";
        "Print+space" = "exec screenshot all";

        # Controll system.
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_SINK@ 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute" = "exec wpctl set-mute @DEFAULT_SOURCE@ toggle";

        "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";

        # Layout.
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+w" = "layout toggle tabbed";
        "${mod}+c" = "splith";
        "${mod}+v" = "splitv";

        # Focus on windows.
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        # Move windows.
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        # Switch to workspaces.
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        # Move to workspaces.
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";
      };
    };
  };
  imports = [
    ./wlogout.nix
    ./waybar.nix
    ./mako.nix
    ../apps/foot.nix
  ];
}

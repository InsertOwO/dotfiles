{config, ...}:

{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      spacing = 4;
      bar_id = "bar-0";
      ipc = true;

      modules-left = ["image" "sway/window" "hyprland/window" "privacy" "sway/mode"];
      modules-center = ["sway/workspaces" "hyprland/workspaces"];
      modules-right = ["memory" "cpu" "network" "battery" "wireplumber" "clock"]; 

      image = {
        on-click = "exec wlogout";
        path = "/home/${config.name}/.local/icon.png";
        size = 20;
      };
      "sway/window" = {
        format = " {title}";
        max-length = 30;
      };
      privacy = {
        icon-spacing = 4;
        icon-size = 16;
        transition-duration = 250;
        modules = [
          {
            type = "screenshare";
            tooltip = true;
            tooltip-icon-size = 24;
          }
          {
            type = "audio-in";
            tooltip = true;
            tooltip-icon-size = 24;
          }
        ];
      };

      "sway/mode" = {
         format = "";
      };

      memory = {
        interval = 30;
        format = "{}";
      };
      cpu = {
        format = "{} ┃";
      };
      network = {
        format-wifi = "{signalStrength}  ";
        tooltip-format-wifi = "{essid} ({signalStrength}%)";
        format-ethernet = " ";
        tooltip-format-ethernet = "{ifname}";
        format-disconnected = " "; 
        on-click = "foot -e 'nmtui'";
      };
      battery = {
        interval = 60;
        format = "{capacity} {icon}";
        format-icons = [" " " " " " " " " "];
        states = {
          "warning" = 30;
          "critical" = 15;
        on-click-right = "hyprsunset -t 3500";
        };
      };
      wireplumber = {
        format = "{volume} {icon}";
        format-muted = "";
        format-icons = ["" " " " "];
        on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
        on-click-right = "pwvucontrol";
      };
      clock = {
        format = "{:%H:%M}";
        format-alt = "{:%d/%m/%y}";
      };
    };

    style = ''
      * {
        font-family: Font Awesome;
        font-size: 15px;
        font-weight: bold;
        border-radius: 25px;
        color:  #${config.color.txtCol};
        background: transparent;
      }

      .modules-left {
        background: #${config.color.bgCol};
        padding: 1px 6px 1px 5px;
        box-shadow: 0px 0px 0px 3px #${config.color.priCol} inset;
      }

      .modules-center {
        background:  #${config.color.bgCol};
      }

      .modules-right {
        background:  #${config.color.bgCol};
        padding: 1px 6px 1px 5px;
        box-shadow: 0px 0px 0px 3px #${config.color.priCol} inset;
      }

      tooltip {
        background: #${config.color.bgCol};
        box-shadow: 0px 0px 0px 3px #${config.color.priCol} inset;
      }

     #workspaces button.active {
        box-shadow: 0px 0px 0px 3px #${config.color.priCol} inset;
      }

     #workspaces button.focused {
        box-shadow: 0px 0px 0px 3px #${config.color.priCol} inset;
      }

      #network.disconnected {
        color: #${config.color.warnCol};
      }

      #battery.charging {
        color:  #${config.color.secCol};
      }

      #battery.critical:not(.charging) {
      	color: #${config.color.warnCol};
      }
    '';
  };
}

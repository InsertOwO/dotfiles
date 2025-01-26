{config, ...}:

{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      spacing = 5;

      modules-left = ["image" "sway/window" "privacy" "sway/mode"];
      modules-center = ["sway/workspaces"];
      modules-right = ["memory" "cpu" "network" "battery" "wireplumber" "clock"]; 

      image = {
        on-click = "exec wlogout";
        path = "/home/${config.name}/.local/icon.png";
        size = 21;
      };
      "sway/window" = {
        format = " {title}";
        max-length = 50;
      };
      privacy = {
        icon-spacing = 4;
        icon-size = 18;
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
        format-ethernet = " ";
        format-disconnected = " "; 
        on-click = "foot -e 'nmtui'";
      };
      battery = {
        interval = 60;
        format = "{capacity} {icon}";
        format-icons = [" " " " " " " " " "];
        states = {
          "warning" = 30;
          "critical" = 15; 
        };
      };
      wireplumber = {
        format = "{volume} {icon}";
        format-muted = "";
        format-icons = ["" "" ""];
      };
      clock = {
        format = "{:%H:%M}";
        format-alt = "{:%d/%m/%y}";
      };
    };

    style = ''
      * {
        font-family: Font Awesome;
        font-size: 13px;
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

      #workspaces button.focused {
        box-shadow: 0px 0px 0px 3px #${config.color.priCol} inset;
      }

      #battery.charging {
        color:  #${config.color.secCol};
      }

      #battery.critical:not(.charging) {
  	color: #cc3436;
      }
    '';
  };
}

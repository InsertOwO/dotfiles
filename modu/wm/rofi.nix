{config, pkgs, ...}:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "Sauce Code Pro NF 14";
    location = "top";
    yoffset = -25;
    theme = builtins.toFile "rofi-theme.rasi" ''
     /*****----- Configuration -----*****/
     configuration {
       modi:                         "drun,filebrowser";
         show-icons:                 true;
         display-drun:               " ";
         display-run:                " ";
         display-filebrowser:        " ";
         display-window:             " ";
       drun-display-format:        "{name}";
       window-format:              "{w}{c}|{t}";
     }

     /*****----- Global Properties -----*****/
    * {
         bg:    #${config.color.bgCol};
         txt:   #${config.color.txtCol};
         pri:   #${config.color.priCol};
         sec:   #${config.color.secCol};
         warn:  #${config.color.warnCol};
         background-color: transparent;
     }

     /*****----- Main Box -----*****/
     mainbox {
         width:            200px;
         spacing:          10px;
         border-radius:    10px;
         border:           3px solid;
         border-color:     @pri;
         text-color:       @txt;
         background-color: @bg;
         children:         ["inputbar", "listview", "message"];
     }

     /*****----- Inputbar -----*****/
     inputbar {
         padding:          10px;
         background-color: @bg;
         text-color:       @txt;
         background-image: url("~/.local/rofi.png");
         children:         ["textbox-prompt-colon", "entry", "mode-switcher"];
     }

     textbox-prompt-colon {
         expand:           false;
         border-radius:    100%;
         padding:          5px;
         str:              " ";
         background-color: inherit;
         text-color:       inherit;
     }
     entry {
         border-radius:    100%;
         padding:          5px;
         placeholder:      "Search...";
         background-color: inherit;
         text-color:       inherit;
     }

     /*****----- Listview -----*****/
     listview {
         scrollbar:        true;
         padding:          15;
         columns:          1;
         lines:            8;
         spacing:          5px;
         text-color:       inherit;
     }
     scrollbar {
         handle-width:     5px;
         handle-color:     @pri;
         border-radius:    10px;
     }

      element {
        enabled:          true;
        border-radius:    5px;
        padding:          4px 2px;
        text-color:       @txt;
      }

     element selected {
         background-color: @pri;
         text-color:       @bg;
     }

     element-text {
         text-color: inherit;
     }

     /*****----- Mode Switcher -----*****/
     button {
         border-radius:    10px;
         background-color: @bg;
         text-color:       @txt;
         padding:          5px;
     }
     button selected {
         background-color: @pri;
         text-color:       @bg;
     }

     /*****----- Message -----*****/
     textbox {
         border-radius:    10px;
         background-color: @bg;
         text-color:       @txt;
         placeholder-color: @txt;
         blink:            true;
         markup:           true;
     }
     error-message {
         padding:          10px;
         border:           2px solid;
         border-radius:    10px;
         border-color:     @pri;
         background-color: @bg;
         text-color:       @txt;
     }
    '';
  };
}

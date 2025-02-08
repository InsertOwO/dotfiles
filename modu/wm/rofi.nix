{config, pkgs, ...}:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "Sauce Code Pro NF 14";
    theme = {
      "*" = {
        background-color = mkLiteral "#${config.color.bgCol}";
        foreground-color = mkLiteral "#${config.color.txtCol}";
        border-color = mkLiteral "#${config.color.priCol}";
        width = 512;
      };

      "#inputbar" = {
        children = map mkLiteral [ "prompt" "entry" ];
      };

      "#textbox-prompt-colon" = {
        expand = false;
        str = ":";
        margin = mkLiteral "0px 0.3em 0em 0em";
        text-color = mkLiteral "@foreground-color";
      };
    };
  };
}

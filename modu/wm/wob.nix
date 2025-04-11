{config, ...}:

{
  services.wob = {
    enable = true;
    settings = {
      "" = {
        timeout = 100;
        max = 100;
        border_size = 10;
        width = 150;
        height = 50;
      };
      style = {
        border_color = "${config.color.priCol}";
        bar_color = "${config.color.secCol}";
        background_color = "${config.color.bgCol}";
      };
    };
  };
}

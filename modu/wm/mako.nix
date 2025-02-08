{config, ...}:

{
  services.mako = {
    enable = true;
    maxVisible = 3;
    borderSize = 3;
    borderColor = "#${config.color.priCol}";
    progressColor = "#${config.color.secCol}";
    backgroundColor = "#${config.color.bgCol}";
  };
}

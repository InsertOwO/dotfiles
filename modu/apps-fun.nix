{config, ...}:

{
  programs = {
    hyfetch = {
      enable = true;
      settings = {
        preset = "bisexual";
        mode = "rgb";
        lightness = 65;
        color_align.mode = "horizontal"
      };
    };
  };
}

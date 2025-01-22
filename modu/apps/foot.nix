{config, pkgs, ...}:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "SourceCodePro:size=10";
      };

      colors= {
       alpha = 0.95;
      };
    };
  };
}

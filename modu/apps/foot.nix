{config, pkgs, ...}:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "SauceCodePro NF:size=10";
      };

      colors = {
        alpha = 0.9;

        foreground="c6d0f5";
        background="303446";

        regular0="51576d";
        regular1="e78284";
        regular2="a6d189";
        regular3="e5c890";
        regular4="8caaee";
        regular5="f4b8e4";
        regular6="81c8be";
        regular7="b5bfe2";

        bright0="626880";
        bright1="e78284";
        bright2="a6d189";
        bright3="e5c890";
        bright4="8caaee";
        bright5="f4b8e4";
        bright6="81c8be";
        bright7="a5adce";

        selection-foreground="c6d0f5";
        selection-background="4f5369";

        search-box-no-match="232634 e78284";
        search-box-match="c6d0f5 414559";

        jump-labels="232634 ef9f76";
        urls="8caaee";
      };
    };
  };
}

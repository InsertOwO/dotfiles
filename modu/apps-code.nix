{pkgs, ...}:

{
  programs = {
    git = {
      enable = true;
      userName = "InsertOwO";
      userEmail = "insertowo@noreply.codeberg.org";
      extraConfig = {
        init.defaultBranch = "main";
        includeIf."hasconfig:remote.*.url:https://github.com/**/**" = {
          userName = "InsertOwO";
          userEmail = "182780075+InsertOwO@users.noreply.github.com";
        };
      };
    };
  };

  home.packages = with pkgs; [
    rustup
    gcc
    lua-language-server
    nil
    ripgrep
  ];

  imports = [./apps/nvim.nix];
}

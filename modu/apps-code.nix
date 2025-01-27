{pkgs, ...}:

{
  programs = {
    git = {
      enable = true;
      userName = "InsertOwO";
      userEmail = "insertowo@noreply.codeberg.org";
      extraConfig = {
        init.defaultBranch = "main";
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

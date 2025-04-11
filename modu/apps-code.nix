{pkgs, ...}:

{
  programs = {
    git = {
      enable = true;
      userName = "InsertOwO";
      userEmail = "insertowo@noreply.codeberg.org";
    };
  };

  home.packages = with pkgs; [
    rustup
    ccls
    lua-language-server
    nil
    man-pages
    man-pages-posix
    godot_4
    cmake
    gnumake
    gcc
    ripgrep
  ];

  imports = [./apps/nvim.nix];
}

{config, pkgs, ...}:

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

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
    };
    
    # Because I haven't configured nvim yet.
    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
  };
}

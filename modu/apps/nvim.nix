{config, pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    extraConfig = ''
      colorscheme catppuccin-macchiato
      set number
      set relativenumber
      set autoindent
      set expandtab
      set tabstop=2
      set shiftwidth=2
      nmap <C-a> :Oil <cr>
      nmap <C-x> :Floaterminal <cr>
    '';

    plugins = with pkgs.vimPlugins; [
      #fuzzy finding and file management.
      telescope-nvim
      plenary-nvim
      oil-nvim
      mini-icons

      # QOL
      autoclose-nvim
      nvim-treesitter.withAllGrammars

      # Making stuff pretty.
      catppuccin-nvim
      lualine-nvim

      # Language server/autocompletion
      nvim-lspconfig
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
    ];

    extraLuaConfig = ''
      require("oil").setup()
      require("mini.icons").setup()
      require("autoclose").setup()
      ${builtins.readFile ./nvim/cmp.lua}
      ${builtins.readFile ./nvim/line.lua}
      ${builtins.readFile ./nvim/floaTerm.lua}
      ${builtins.readFile ./nvim/telescope.lua}
    '';
  };
}

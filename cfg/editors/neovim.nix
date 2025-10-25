{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins =
      let
        nvim-treesitter-with-plugins = pkgs.vimPlugins.nvim-treesitter.withPlugins (
          treesitter-plugins: with treesitter-plugins; [
            bash
            tree-sitter-norg
            tree-sitter-norg-meta
            c
            lua
            nix
            rust
          ]
        );
      in
      with pkgs.vimPlugins; # todo() use lazy
      [
        nvim-treesitter-with-plugins
        neo-tree-nvim
        neorg
        conform-nvim
        miasma-nvim
        blink-cmp
        telescope-nvim
        plenary-nvim
        mini-nvim
        cord-nvim
        gitsigns-nvim
        vim-wakatime
      ];
  };
  home.packages = [
    pkgs.luajit
    pkgs.nixfmt
    pkgs.tree-sitter
  ];
}

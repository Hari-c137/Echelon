{ pkgs, ... }:

{
  programs.neovim = {
    enable = false;
    defaultEditor = false;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins =
      let
        nvim-treesitter-with-plugins = pkgs.vimPlugins.nvim-treesitter.withPlugins (
          treesitter-plugins: with treesitter-plugins; [
            bash
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
        conform-nvim
        blink-cmp
        miasma-nvim
        telescope-nvim
        plenary-nvim
        gitsigns-nvim
        vim-wakatime
      ];
  };
  home.packages = [
    pkgs.luajit
    pkgs.tree-sitter
  ];
}

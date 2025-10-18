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
            c
            lua
            nix
            rust
          ]
        );
      in
      with pkgs.vimPlugins;
      [
        nvim-treesitter-with-plugins
        neo-tree-nvim
        oxocarbon-nvim
        conform-nvim
        blink-cmp
        cord-nvim
        gitsigns-nvim
        vim-wakatime
      ];
  };
  home.packages = [
    pkgs.luajit
    pkgs.nixfmt
  ];
}

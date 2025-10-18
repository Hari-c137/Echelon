{
  config,
  pkgs,
  inputs,
  system,
  ...
}:

{
  home.username = "x137";
  home.homeDirectory = "/home/x137";
  home.stateVersion = "25.05"; # should this be equal to system.Sver or unstableV? (need to read the docs more about basic NixOS stuff)
  programs.home-manager.enable = true;

  imports = [
    ./bash.nix
    ./kitty.nix
    ./neovim.nix
    ./wall.nix
    ./vencord.nix
    ./zen.nix
    ./symlinks.nix
    ./walker.nix
    ./fzf.nix
  ];
}

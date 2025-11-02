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
    ./editors/editors.nix
    ./shells/shells.nix
    ./programs/programs.nix
    ./cli/cli.nix
    ./kitty.nix
    ./wall.nix
    ./niri.nix
    ./symlinks.nix
    ./mpv.nix
    ./virtualization.nix
  ];

}

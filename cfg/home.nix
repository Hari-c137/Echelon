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
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  imports = [
    ./editors/editors.nix
    ./shells/shells.nix
    ./programs/programs.nix
    ./cli/cli.nix
    ./kitty.nix
    ./wall.nix
    ./quickshell.nix
    ./niri.nix
    ./../symlinks/symlinks.nix
    ./mpv.nix
    ./virtualization.nix
  ];

}

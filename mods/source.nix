{ pkgs, config, ... }:
{

  imports = [
    ./shell.nix
    ./performance.nix
    ./qbit.nix
    ./audio.nix
    ./stylix.nix
    ./dev.nix
    ./scripts.nix
    ./cosmic.nix
  ];

}

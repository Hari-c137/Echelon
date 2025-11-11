{ pkgs, config, ... }:
{

  imports = [
    ./desktop/cosmic/default.nix
    ./shell.nix
    ./performance.nix
    ./qbit.nix
    ./audio.nix
    ./formatters.nix
    ./nh.nix
    ./scripts.nix
    ./virtualization.nix
  ];

}

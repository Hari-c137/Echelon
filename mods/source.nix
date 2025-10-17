{ pkgs, config, ... }: {

  imports = [ ./shell.nix ./performance.nix ./qbit.nix ./audio.nix ./dev.nix ./scripts.nix  ];

}

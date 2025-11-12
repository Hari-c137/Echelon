{ pkgs, ... }:

{
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
    package = pkgs.quickshell;
  };
}

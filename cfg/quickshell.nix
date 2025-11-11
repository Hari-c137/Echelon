{ pkgs, ... }:

{
  programs.quickshell = {
    enable = true;
    systemd = true;
    package = pkgs.quickshell;
  };

}

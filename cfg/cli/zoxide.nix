{ pkgs, ... }:

{
  programs.zoxide = {
    enable = true;
    package = pkgs.zoxide;
    options = [ ];
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };
}

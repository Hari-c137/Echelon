{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = { werk = "echo baseball huh"; };
  };

}

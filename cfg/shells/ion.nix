{ pkgs, ... }:

{
  programs.ion = {
    enable = true;
    package = pkgs.ion;
    shellAliases = {
      gs = "git status";
    };

  };
}

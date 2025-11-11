{ pkgs, ... }:

{
  programs.ion = {
    enable = true;
    package = pkgs.ion;
    shellAliases = {
      gs = "git status";
      gp = "git push -u origin main";
    };

  };
}

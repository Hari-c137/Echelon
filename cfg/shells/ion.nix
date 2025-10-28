{ pkgs, ... }:

{
  programs.ion = {
    enable = true;
    package = pkgs.ion;
    shellAliases = {
      gs = "git status";
      nvim = "hx";
      gp = "git push -u origin main";
    };

  };
}

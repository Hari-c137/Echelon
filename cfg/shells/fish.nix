{ config, pkgs, ... }:

let
  aliasfish = {
    gs = "git status";
    up = "sudo nixos-rebuild switch --flake ~/code/echelon#skynet --upgrade";
    re = "sudo nixos-rebuild switch --flake ~/code/echelon#skynet";
    gp = "git push -u origin main";
  };

in
{

  programs.fish = {
    enable = true;
    shellAliases = aliasfish;
  };

}

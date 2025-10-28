{ config, pkgs, ... }:

let
  aliasfish = {
    gs = "git status";
    up = "sudo nixos-rebuild switch --flake ~/code/echelon#skynet --upgrade";
    re = "sudo nixos-rebuild switch --flake ~/code/echelon#skynet";
    gp = "git push -u origin main";
    # yy is yazi
    j = "z";
    jj = "zi";
    cd = "z";
    nvim = "hx"; # yeah... old habits die hard
  };

in
{

  programs.fish = {
    enable = true;
    shellAliases = aliasfish;
  };

}

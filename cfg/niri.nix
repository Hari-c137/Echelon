{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
  ];

  #= Used Packages
  home.packages = with pkgs; [
    wl-clipboard-rs
  ];
}

{ inputs, pkgs, ... }:
{
  programs.wezterm = {
    enable = false;
    package = inputs.wezterm.packages.${pkgs.system}.default;
  };
}

{ pkgs, ... }:

{
  services.swww = {
    enable = false;
    package = pkgs.swww;
  };
}

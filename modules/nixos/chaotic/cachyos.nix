{ inputs, pkgs, ... }:

{
  imports = [ inputs.chaotic.nixModules.default ];

  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  services.ananicy = {
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos_git;
    enable = true;
  };
}
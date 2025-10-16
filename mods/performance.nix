{ config, pkgs, inputs, ... }:

{

  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  hardware.amdgpu.overdrive.enable = true;
  hardware.amdgpu.initrd.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.lact = { enable = true; };

  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos_git;
  };

}

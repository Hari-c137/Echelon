{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./mods/shell.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "skynet"; 

  time.timeZone = "Asia/Kolkata";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.x137 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
    packages = with pkgs; [
      tree
    ];
  };


  programs.firefox.enable = true;
  programs.niri.enable = true;

  fonts.packages = with pkgs; [
     nerd-fonts.blex-mono
  ];


#  programs.git = {
#   enable = true;
#   config = {
#   	user = {
#		name = "ClearlyOpaque";
#		email = "hariprasadaji465@gmail.com";
#	};
#     };
#  };


  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware.amdgpu.overdrive.enable = true;
  services.lact = {
	enable = true;
  };

  environment.systemPackages = with pkgs; [
    neovim
    wl-clipboard
    walker
    curl
    ripgrep
    fd
    bat
    eza
    du-dust
    swww
    fastfetch
    kitty
    alacritty
  ];

  services.displayManager.ly.enable = true;
  services.hardware.openrgb.enable = true;
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";

}


{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
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


  programs.git = {
   enable = true;
   config = {
   	user = {
		name = "Hari-c137";
		email = "hariprasadaji465@gmail.com";
	};
     };
  };

  programs.fish = {
   enable = true;
   shellAliases = {
    	rebuild = "sudo nixos-rebuild switch --flake ~/code/echelon#skynet";
	gs = "git status";
	gp = "git push -u origin main";
     };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    neovim
    wl-clipboard
    walker
    discord
    curl
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


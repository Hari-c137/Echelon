{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./../../mods/source.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "skynet";
    networkmanager = {
      enable = true;
    };
  };

  time.timeZone = "Asia/Kolkata";
  nixpkgs.config.allowUnfree = true;

  users.users.x137 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
      simulide
    ];
  };

  programs.niri.enable = true;
  programs.lazygit.enable = true;

  services.displayManager.ly.enable = true;

  services.hardware.openrgb = {
    enable = true;
    motherboard = "intel";
    server.port = 6742;
    startupProfile = "norgb.orp";
  };

  fonts.packages = with pkgs; [ nerd-fonts.blex-mono ];
  #   stylix.enable = true;

  nix.settings = {
    extra-substituters = [
      "https://walker.cachix.org"
      "https://walker-git.cachix.org"
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    extra-trusted-public-keys = [
      "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
      "walker-git.cachix.org-1:vmC0ocfPWh0S/vRAQGtChuiZBTAe4wiKDeyyXM0/7pM="
    ];
  };
  environment.systemPackages = with pkgs; [
    (lib.hiPrio pkgs.uutils-coreutils-noprefix) # what could go wrong..?
    wl-clipboard
    btop
    gcc
    wget
    gnumake
    unzip
    rust-analyzer
    curl
    yazi
    heroic
    ripgrep
    fd
    pwvucontrol
    bat
    fastfetch
  ];

  system.stateVersion = "25.05";

}

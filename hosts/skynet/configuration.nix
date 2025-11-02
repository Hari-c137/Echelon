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
    extraGroups = [ "wheel" "libvirtd" ];
    packages = with pkgs; [
      tree
      vicinae
      simulide
    ];
  };
  users.users.c137 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  #  systemd.user.targets.cosmic-session.enable = false;
  services.displayManager.cosmic-greeter.enable = true;
  services.emacs.enable = true;

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  security.polkit.enable = true;
  security.sudo-rs = {
    enable = true;
  };

  programs.niri.enable = true;

  services.hardware.openrgb = {
    enable = true;
    motherboard = "intel";
    server.port = 6742;
    startupProfile = "norgb.orp";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
  ];

  nix.settings = {
    extra-substituters = [
      "https://vicinae.cachix.org"
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    extra-trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
    ];
  };
  environment.systemPackages = with pkgs; [
    (lib.hiPrio pkgs.uutils-coreutils-noprefix) # what could go wrong..?
    wl-clipboard
    btop
    polkit_gnome
    gcc
    nautilus
    wget
    gnumake
    cmake
    fuzzel
    evil-helix
    unzip
    rust-analyzer
    curl
    heroic
    pwvucontrol
    fastfetch
  ];

  system.stateVersion = "25.05";

}

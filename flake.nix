{
  description = "Echelon";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    wezterm = {
      url = "github:wezterm/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    vicinae.url = "github:vicinaehq/vicinae";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cosmic-ext-extra-sessions = {
      url = "github:KiaraGrouwstra/cosmic-ext-extra-sessions?ref=niri-screen-share";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      chaotic,
      rust-overlay,
      neovim-nightly-overlay,
      home-manager,
      cosmic-ext-extra-sessions,
      vicinae,
      zen-browser,
      ...
    }@inputs:
    {
      nixosConfigurations.skynet = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [
          (
            { pkgs, libs, ... }:
            {
              nixpkgs.overlays = [
                rust-overlay.overlays.default
                inputs.niri.overlays.niri
                inputs.neovim-nightly-overlay.overlays.default
              ];
            }
          )
          ./hosts/skynet/configuration.nix
          chaotic.nixosModules.default
          (
            { pkgs, ... }:
            {
              environment.systemPackages = [
                pkgs.rust-bin.stable.latest.default
              ];
            }
          )
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.x137 = import ./cfg/home.nix;
              extraSpecialArgs = {
                inherit inputs;
                system = "x86_64-linux";
              };
            };
          }
        ];
      };
    };
}

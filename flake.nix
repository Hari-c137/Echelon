{
  description = "Echelon";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, chaotic, rust-overlay, neovim-nightly-overlay, ... } @ inputs:
  {
	nixosConfigurations.skynet = nixpkgs.lib.nixosSystem {
	  specialArgs = { inherit inputs; };
	  system = "x86_64-linux";
	  modules = [
	  	./configuration.nix
		chaotic.nixosModules.default
		({pkgs, ... }: {
			nixpkgs.overlays = [ rust-overlay.overlays.default ];
			environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
		})
	  ];
	};

  };
}

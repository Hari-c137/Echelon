{
  description = "Echelon";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = { self, nixpkgs, chaotic, ... } @ inputs:
  {
	nixosConfigurations.skynet = nixpkgs.lib.nixosSystem {
	  specialArgs = { inherit inputs; };
	  modules = [
	  	./configuration.nix
		chaotic.nixosModules.default
	  ];
	   
	};

  };
}

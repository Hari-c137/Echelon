{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... } @ inputs:
  {
	nixosConfigurations.skynet = nixpkgs.lib.nixosSystem {
	  modules = [
	  	./configuration.nix
	  ];
	   
	};

  };
}

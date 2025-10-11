{ config, pkgs, ... }: 

let 
   aliasfish = {
    	rebuild = "sudo nixos-rebuild switch --flake ~/code/echelon#skynet";
	gs = "git status";
	gp = "git push -u origin main";
   };
in 

{


  programs.git = {
   enable = true;
   config = {
   	init.defaultBranch = "main";
   	user = {
		name = "ClearlyOpaque";
		email = "hariprasadaji465@gmail.com";
	};
     };
  };

  environment.systemPackages = with pkgs; [
  	helix
  ];

  programs.fish = {
   enable = true;
   shellAliases = aliasfish;
  };

}

{ config, pkgs, ... }: 

let 
   aliasfish = {
    	rebuild = "sudo nixos-rebuild switch --flake ~/code/echelon#skynet";
	gs = "git status";
	ls = "eza";
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

  programs.fish = {
   enable = true;
   shellAliases = aliasfish;
  };

}

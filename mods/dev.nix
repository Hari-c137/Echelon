{ pkgs, ... }:

{
	
  environment.systemPackages = with pkgs; [
    stylua
  ];
}

{ config, pkgs, ... }:
{ 
  home.username = "dinzz";
  home.homeDirectory = "/home/dinzz";
  home.stateVersion = "26.05";

  programs.bash = {
     enable = true;
     shellAliases = {
      	btw = "echo I use nixos btw";
	nrs = "sudo nixos-rebuild switch";
      };
      };
 xdg.configFile."niri/config.kdl".source = ./dotfiles/niri/config.kdl;
}

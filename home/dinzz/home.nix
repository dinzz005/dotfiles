{ config, pkgs, ... }:
{ 
  imports = [
  ./programs/lf.nix
  ./programs/fish.nix
  ];
  home.username = "dinzz";
  home.homeDirectory = "/home/dinzz";
  home.stateVersion = "26.05";

 xdg.configFile."niri/config.kdl".source = ./dotfiles/niri/config.kdl;
}

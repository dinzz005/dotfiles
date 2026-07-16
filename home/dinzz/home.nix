{ config, pkgs, ... }:
{ 
  imports = [
  ./programs/lf.nix
  ./programs/fish.nix
  ./programs/kitty.nix
  ];
  home.username = "dinzz";
  home.homeDirectory = "/home/dinzz";
  home.stateVersion = "26.05";
  xdg.configFile."niri/config.kdl".source = ./dotfiles/niri/confug.kdl;
}

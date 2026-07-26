{ config, pkgs, ... }:
{ 
  imports = [
  ./programs/theme.nix
  ./programs/fish.nix
  ./programs/zen-browser.nix
  ./programs/ashell.nix
  ];
  home.username = "dinzz";
  home.homeDirectory = "/home/dinzz";
  home.stateVersion = "26.05";
}

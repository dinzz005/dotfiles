{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      btw = "echo I use NixOS btw";
      nrs = "sudo nixos-rebuild switch";
    };

    interactiveShellInit = ''
      set -g fish_greeting
    '';
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.eza.enable = true;
  programs.bat.enable = true;
}

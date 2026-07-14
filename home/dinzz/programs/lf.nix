{ pkgs, ... }:

{
  programs.lf = {
    enable = true;
  };

  home.packages = with pkgs; [
    file
    unzip
    zip
    p7zip
    poppler-utils
    jq
    bat
    eza
    fd
    ripgrep
    chafa
  ];
}

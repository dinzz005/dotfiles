{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    withNodeJs = true;
    withPython3 = true;
    withRuby = false;
  };

  home.packages = with pkgs; [
    gcc
    git
    ripgrep
    fd
    unzip
    xclip
    wl-clipboard
    tree-sitter
    lua-language-server
    stylua
    nil
  ];

  xdg.configFile."nvim".source = ../dotfiles/nvim;
}

{ pkgs, inputs, ... }:

{
  home.packages = [
    inputs.qml-niri.packages.${pkgs.system}.quickshell-niri
  ];

#  xdg.configFile."quickshell".source = ../dotfiles/quickshell;
}

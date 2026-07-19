{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
  ];
  
  xdg.configFile."niri/config.kdl".source = ../dotfiles/niri/config.kdl;

  programs.dank-material-shell = {
    enable = true;

    dgop.package = inputs.dgop.packages.${pkgs.system}.default;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    enableSystemMonitoring = true;
    enableVPN = true;
    enableAudioWavelength = true;
  };
}

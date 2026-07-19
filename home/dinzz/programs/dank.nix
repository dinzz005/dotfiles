{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell
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

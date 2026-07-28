{ config, pkgs, ... }:

{
  programs.ashell = {
    enable = true;

    systemd.enable = true;

    settings = {
      # Uses metric units (°C) instead of imperial (°F)
      region = "en-IN";

      modules = {
        left = [ "Workspaces" ];

        center = [ "WindowTitle" ];

        right = [
          "SystemInfo"
          [
            "Clock"
            "Settings"
          ]
        ];
      };
    };
  };
}

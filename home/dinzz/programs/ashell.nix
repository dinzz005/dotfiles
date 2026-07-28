programs.ashell = {
  enable = true;
  systemd.enable = true;

  settings = {
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

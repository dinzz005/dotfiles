{ pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  qt = {
    enable = true;

    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  home.packages = with pkgs; [
    adwaita-icon-theme
    papirus-icon-theme
    bibata-cursors
  ];
}

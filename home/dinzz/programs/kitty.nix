{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

    settings = {
      confirm_os_window_close = 0;

      enable_audio_bell = false;
      visual_bell_duration = 0;

      cursor_shape = "beam";
      cursor_blink_interval = 0.5;

      background_opacity = "0.95";

      window_padding_width = 8;

      tab_bar_style = "powerline";

      shell_integration = "enabled";

      allow_remote_control = "yes";
    };

    themeFile = "Cobalt Neon";
  };
}

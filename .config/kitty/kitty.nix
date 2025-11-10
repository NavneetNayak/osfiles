{ pkgs, lib, ... }:

let
  theme = builtins.readFile ./theme.conf;
in
{
  programs.kitty = {
    enable = true;

    enableGitIntegration = true;
    shellIntegration.enableZshIntegration = true;

    settings = {
      enable_audio_bell = false;
      scrollback_lines = 10000;
      background_opacity = 1;
      window_padding_width = 2;
      confirm_os_window_close = 0;
      allow_remote_control = "yes";
      dynamic_background_opacity = false;
      background = "#101010";
    };

    keybindings = {
      "ctrl+t" = "none";
      "ctrl+w" = "none";
      "ctrl+shift+f" = "none";

      "ctrl+shift+," = "load_config_file";
      "SUPER+t" = "new_os_window_with_cwd";
    };

    font = {
      name = "Iosevka";
      size = 13.0;
    };

    extraConfig = theme;
  };
}

{ pkgs, lib, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = [
        ",preferred,auto,1.6"
        ",addreserved,1,0,0,0"
      ];

      env = [
        "GTK_THEME, Gruvbox-Dark"
        "GTK_THEME, Gruvbox-Dark"
        "XCURSOR_THEME, Adwaita"
        "XCURSOR_SIZE, 20"
        "QT_QPA_PLATFORMTHEME, adwaita"
      ];

      exec-once = [
        "hyprctl setcursor macOS 20"
      ];

      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$browser" = "zen-beta";
      "$music" = "youtube-music";

      general = {
        gaps_in = 1;
        gaps_out = 1;
        border_size = 1;
        "col.active_border" = "rgba(EBDBB388)";
        "col.inactive_border" = "rgba(EBDBB366)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 0;
        rounding_power = 0;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = { enabled = false; };
        blur = { enabled = false; };

        dim_special = 0.0;
        dim_strength = 0.0;
      };

      animations = { enabled = false; };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master.new_status = "master";

      misc = {
        force_default_wallpaper = false;
        disable_hyprland_logo = true;
        background_color = "rgba(101010ff)";
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_rules = "";
        kb_options = "ctrl:nocaps";
        follow_mouse = 1;
        repeat_delay = 200;
        repeat_rate = 50;
        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.6;
          clickfinger_behavior = true;
        };
      };

      gesture = "3, horizontal, workspace, scale: 1.5";

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      windowrulev2 = [
        "nodim, class:.*"
        "float, class:^(.*pavucontrol*.)$"
        "suppressevent maximize, class:.*"
        "float, class:^Pulsemixer$"
        "size 665 250, class:^Pulsemixer$"
        "move 925 715, class:^Pulsemixer$"
        "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
      ];

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, O, exec, ${pkgs.writeShellScriptBin "toggle-waybar" (builtins.readFile ./toggle-waybar.sh)}/bin/toggle-waybar"
        "$mainMod, K, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT, X, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating"
        "$mainMod, V, resizeActive, exact 1200 800"
        "$mainMod, V, centerWindow"
        "$mainMod, Space, exec, fuzzel"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, F, fullscreen"
        "$mainMod, C, exec, ${pkgs.writeShellScriptBin "screenshot" (builtins.readFile ./screenshot.sh)}/bin/screenshot"
        "$mainMod SHIFT, C, exec, hyprpicker | tee >(wl-copy) | xargs dunstify 'Copied to clipboard!' -t 1000"
        "$mainMod, X, swapsplit"
        "$mainMod, Z, togglefloating"
        "$mainMod ,L, exec, togglegroup"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod, RETURN, exec, [float; center; size 1200 800] $terminal"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, A, togglespecialworkspace, browser"
        "$mainMod SHIFT, A, movetoworkspace, special:browser"
        "$mainMod CONTROL, A, exec, [workspace special browser;] $browser"
        "$mainMod, M, togglespecialworkspace, music"
        "$mainMod SHIFT, M, movetoworkspace, special:music"
        "$mainMod CONTROL, M, exec, [workspace special music;] $music"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
    };
  };
}


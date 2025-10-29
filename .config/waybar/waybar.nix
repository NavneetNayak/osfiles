{ pkgs, lib, ... }:

let
  theme = builtins.readFile ./theme.css;
in
{
  programs.waybar = {
    enable = true;

    settings = {
    mainBar = {
        position = "bottom";
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [ "pulseaudio" "network" "backlight" "battery" "clock" ];

        clock = {
          format = "clk: {0:%d}/{0:%m}/{0:%y} | \"{0:%a}\" | {0:%H}:{0:%M}";
          tooltip = false;
        };

        backlight = {
          format = "brt:{percent}%";
          tooltip = false;
        };

        battery = {
          states = {
            good = 95;
            critical = 15;
          };
          format = "btr:{capacity}%";
          format-charging = "btr-c:{capacity}%";
          format-plugged = "btr-p{capacity}%";
          tooltip = false;
        };

        network = {
          interval = 1;
          format-wifi = "net:\"{essid}\":{signalStrength}";
          format-ethernet = "net:{ifname}:{ipaddr}/{cidr}";
          format-linked = "net:{ifname}:(No IP)";
          format-disconnected = "net:Disconnected";
          format-alt = "net:{ifname}:{ipaddr}/{cidr}";
          tooltip = false;
        };

        pulseaudio = {
          format = "vol:{volume}% {format_source}";
          format-bluetooth = "vol(bt):{volume}%";
          format-bluetooth-muted = "btmute:{format_source}";
          format-muted = "mute:{format_source}";
          format-source = "m:{volume}%";
          format-source-muted = "mute-mic";
          on-click = "kitty --class=Pulsemixer -e pulsemixer";
          tooltip = false;
        };

        tray = {
          icon-size = 21;
          spacing = 10;
          show-passive-items = true;
        };
      };
    };

    style = theme;
  };
}

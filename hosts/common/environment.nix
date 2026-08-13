{ config, pkgs, ... }: {
  environment = {
    sessionVariables = {
      GSK_RENDERER = "ngl";

      GTK_USE_PORTAL = "0";
      GTK_APPLICATION_PREFER_DARK_THEME = "1";

      NIXOS_OZONE_WL = "1";
    };

    pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
  };

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  fonts = {
    packages = with pkgs; [
      iosevka
    ];
  };

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;

    docker = {
      enable = false;

      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };  
  
  services = {
    libinput.enable = true;
    printing.enable = true;

    qemuGuest.enable = true;
    spice-vdagentd.enable = true;
  };

  systemd.services.nix-daemon.environment.TMPDIR = "/var/tmp";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.package = pkgs.nixVersions.latest;
}

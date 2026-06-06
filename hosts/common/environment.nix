{ config, pkgs, inputs, ... }: {
  environment = {
    sessionVariables = {
      GSK_RENDERER = "ngl";

      GTK_USE_PORTAL = "0";
      GTK_APPLICATION_PREFER_DARK_THEME = "1";

      NIXOS_OZONE_WL = "1";
    };
  };

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  fonts = {
    packages = with pkgs; [
      iosevka
      newcomputermodern
    ];
  };

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;

    docker = {
      enable = true;

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

    prometheus = {
      enable = true;
      globalConfig.scrape_interval = "10s";
      scrapeConfigs = [
        {
          job_name = "hunt";
          static_configs = [{
            targets = [ "localhost:8080" ];
          }];
        }
      ];
    };
  };

  nix.package = pkgs.nixVersions.latest;

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };
}

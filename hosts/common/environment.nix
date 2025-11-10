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
    ];
  };

  virtualisation = {
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
  };

  nix.package = pkgs.nixVersions.latest;

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
  };
}

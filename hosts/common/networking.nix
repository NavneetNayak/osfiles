{ config, lib, pkgs, ... }: {
  networking = {
    hostName = "acai";

    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";

    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };
  };

  services.openssh = {
    enable = true;
  };
}

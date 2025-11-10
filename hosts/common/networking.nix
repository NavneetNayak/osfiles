{ config, lib, pkgs, ... }: {
  networking = {
    hostName = "acai";

    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";

    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };

    nftables.enable = true;
    firewall.enable = true;
  };

  services.openssh = {
    enable = true;
  };
}

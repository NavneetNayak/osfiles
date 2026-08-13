{ config, lib, pkgs, ... }: {
  networking = {
    hostName = "acai";

    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";

    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };

    nftables.enable = false;
    firewall = {
      enable = true;
      package = pkgs.iptables;
    };
  };

  services.openssh = {
    enable = true;
  };
}

{config, lib, pkgs, ... }: {
  hardware = {
    asahi = {
      enable = true;
      setupAsahiSound = true;
      peripheralFirmwareDirectory = /boot/vendorfw;
    };

    graphics.enable = true;
    enableAllFirmware = true;
  };

  # enable correct gpu
  environment.variables = {
    WLR_DRM_DEVICES = "/dev/dri/card0";
  };  
}

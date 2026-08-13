{config, ... }: {
  hardware = {
    apple.touchBar.enable = true;

    asahi = {
      enable = true;
      setupAsahiSound = true;
      peripheralFirmwareDirectory = /boot/vendorfw; # impure
    };

    graphics.enable = true;
    enableAllFirmware = true;
  };

  # enable correct gpu
  environment.variables = {
    WLR_DRM_DEVICES = "/dev/dri/card0";
  };  
}

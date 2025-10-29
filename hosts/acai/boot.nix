{config, lib, pkgs, ...}: {
  boot = {
    m1n1CustomLogo = ./assets/bootlogo.png;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };

    tmp = {
      cleanOnBoot = true;
      useTmpfs = true;
    };

    kernelParams = [
      "zswap.enabled=1"
      "zswap.compressor=zstd"
      "zswap.zpool=zmalloc"
      "zswap.max_pool_percent=50"
    ];
  };
}

{ config, lib, pkgs, ... }: {
  system.stateVersion = "25.05";

  systemd.services.nix-daemon.environment.TMPDIR = "/var/tmp";
}

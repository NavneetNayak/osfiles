{ config, lib, pkgs, ... }: {
  users.mutableUsers = true;

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  users.users."navneetnayak" = {
    initialPassword = "navneetnayak";
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "networkmanager"];
  };
}

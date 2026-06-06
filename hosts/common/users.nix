{ config, lib, pkgs, ... }: {
  users.mutableUsers = true;

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  programs.dconf.enable = true;
  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
  ];

  users.users."navneetnayak" = {
    initialPassword = "navneetnayak";
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "networkmanager" "libvirtd"];
  };

  nix.settings.trusted-users = [ "root" "navneetnayak" ];
}

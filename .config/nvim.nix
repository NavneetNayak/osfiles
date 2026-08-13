{ pkgs, lib, config, inputs, ... }: 
let
  mkOutOfStoreSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configPath = "${config.home.homeDirectory}/nixos/.config/neovim";
in {
  programs.neovim = {
    enable = true;

    defaultEditor = true;
  };

  home.file."${config.xdg.configHome}/nvim".source = mkOutOfStoreSymlink "${configPath}/nvim";
}

{ pkgs, lib, config, inputs, ... }: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;
  };

  home.file."${config.xdg.configHome}/nvim".source = ./nvim;
}

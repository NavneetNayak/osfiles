{ pkgs, lib, config, inputs, ... }: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    withRuby = false;
    withPython3 = false;
  };

  home.file."${config.xdg.configHome}/nvim".source = ./nvim;
}


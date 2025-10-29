{ pkgs, lib, inputs, config, ... }: {
  programs.direnv = {
    enable = true;
    enableZshIntegration = true; 
    nix-direnv.enable = true;
  };

  home.file."${config.xdg.configHome}/direnv/direnv.toml".text = ''
    [global]
    hide_env_diff = true
    log_filter = "^direnv: (loading|using|nix-direnv: Using cached dev shell)"
  '';
}

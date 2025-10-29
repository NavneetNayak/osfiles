{ pkgs, lib, config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    dotDir = config.home.homeDirectory;

    shellAliases = {
      # general
      c = "clear";
      p = "pwd";
      v = "nvim";

      # nixos
      nix-clean = "nix-collect-garbage -d && nix-store --optimize && nix-store --gc";
      nix-rebuild = "sudo nixos-rebuild switch";
      
      # git
      gs = "git status";
      gl = "git log";
      gp = "git pull";
      gd = "git diff";
      gb = "git branch";
    };

    initContent = ''
      if [[ -z "$IN_NIX_SHELL" ]]; then  
        export PS1=$'\n'"%~"$'\n'"-> " 
      else 
         export PS1=$'\n'"%F{#7FA563}(nix-shell)%f %~"$'\n'"-> "
      fi 

      autoload -Uz add-zsh-hook
      add-zsh-hook precmd () {
        ZSH_HIGHLIGHT_STYLES[command]='fg=#7FA563'
        ZSH_HIGHLIGHT_STYLES[builtin]='fg=#7FA563'
        ZSH_HIGHLIGHT_STYLES[function]='fg=#7FA563'
        ZSH_HIGHLIGHT_STYLES[alias]='fg=#7FA563'
      }

      nix () {
        if [[ "$1" == "develop"  ]]; then
          shift 
          command nix develop "$@" -c $SHELL
        else 
          command nix "$@"
        fi
      }

      nix-shell () {
        command nix-shell --run $SHELL $@
      }
    '';

    envExtra = ''
      export GSK_RENDERER="ngl";
      export ZVM_CURSOR_STYLE_ENABLED=false
      export EDITOR=nvim
    '';

    history = {
      size = 10000;
      ignoreSpace = true;
    };

    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];
  }; 
}

{ config, lib, pkgs, system, inputs, ... }: {
  imports = [
    ./gtk/gtk.nix
    ./kitty/kitty.nix
    ./zsh.nix
    ./fuzzel.nix
    ./direnv.nix
    ./hyprland/hyprland.nix
    ./neovim/neovim.nix
  ];

  home.username = "navneetnayak";
  home.homeDirectory = "/home/navneetnayak";

  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default 

    # system
    playerctl
    grim
    slurp
    wl-clipboard
    btop
    xfce.thunar
    hyprpicker
    waybar
    brightnessctl
    pulsemixer
    bluetuith
    fastfetch

    # general
    acpi
    obsidian
    telegram-desktop
    mpv
    zathura #TBC
    youtube-music #TBC

    # programming language stuff
    python3
    gcc
    gnumake

    # programming tools
    wget
    fzf
    ripgrep
    unzip
    tree 
  ];

  xdg = {
    configHome = "${config.home.homeDirectory}/.config";

    mimeApps = {
      enable = true;

      defaultApplications = {
        "inode/directory" = "xfce.thunar";
      };
    };
  };

  services = {
    dunst = {
      enable = true;

      settings = {
        global = {
          offset = "-30x50";
          transparency = 10;
          frame_color = "#90816B";
          font = "Iosevka";
          frame_width = 1;
        };

        urgency_normal = {
          background = "#111111";
          foreground = "#ebdbb2";
          timeout = 10;
        };
      };
    };
  };

  programs = {
    git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
      };
    };
  
    zoxide = {
      enable = true;

      enableZshIntegration = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
      colors = "always";
      git = true;
      icons = "always";
    };
  };

  home.stateVersion = "25.05";
}

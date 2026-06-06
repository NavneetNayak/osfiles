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
    helium
    chromium
    
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
    dconf

    # general
    acpi
    obsidian
    telegram-desktop
    mpv
    sioyek
    ncdu
    vesktop
    unstable.melonds
    unstable.mgba
    youtube-music

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
    devenv
    lazygit

    (pkgs.writeShellScriptBin "icat-open" ''
      kitty --class icat-float \
        -e sh -c 'kitten icat "$1"; read' sh "$1"
    '')
  ];

  xdg = {
    configHome = "${config.home.homeDirectory}/.config";

    mimeApps = {
      enable = true;

      defaultApplications = {
        "inode/directory" = "xfce.thunar";
      };
    };

    desktopEntries.icat = {
      name = "Kitty Icat";
      exec = "icat-open %f";
      mimeType = [
        "image/png"
        "image/jpeg"
        "image/webp"
        "image/gif"
        "image/bmp"
      ];
    };

    mimeApps.defaultApplications = {
      "image/png" = "icat.desktop";
      "image/jpeg" = "icat.desktop";
      "image/webp" = "icat.desktop";
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

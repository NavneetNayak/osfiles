{ pkgs, lib, ... }:

let
  theme = builtins.readFile ./theme.css;
in
{
  gtk = {
    enable = true;

    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 20;
    };

    font = {
      name = "Iosevka";
      size = 12;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-cursor-theme-size = 20;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-cursor-theme-size = 20;
    };

    gtk4.theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };

    gtk3.extraCss = theme;
    gtk4.extraCss = theme;
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "gruvbox-dark";
        icon-theme = "Papirus-Dark";
        cursor-theme = "Adwaita";
        cursor-size = 20;
        font-name = "Iosevka 12";
      };
    };
  };

  home.sessionVariables = {
    GTK_THEME = "gruvbox-dark";
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "20";
  };
}

{ pkgs, lib, ... }:

let
  theme = builtins.readFile ./theme.css;
in
{
  gtk = {
    enable = true;
    
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
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
      size = 11;
    };
    
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-cursor-theme-size = 20;
    };
    
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-cursor-theme-size = 20;
    };
    
    gtk3.extraCss = theme;
    gtk4.extraCss = theme;
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "Gruvbox-Dark";
        icon-theme = "Papirus-Dark";
        cursor-theme = "Adwaita";
        cursor-size = 20;
        font-name = "Iosevka 11";
      };
    };
  };

  home.sessionVariables = {
    GTK_THEME = "Gruvbox-Dark";
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "20";
  };
}

{ pkgs, lib, ... }: {
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        prompt = "-> ";
        match-mode = "fzf";
        anchor = "center";
        lines = 10;
        width = 60;
        layer = "overlay";
      };

      border = {
        radius = 0;
      };

      colors = {
        background = "#121212ff";
        text = "#a89984ff";
        selection = "#595959ff";
        selection-text = "#1d2021ff";
        match = "#83a598ff";
        selection-match = "#ebdbb2ff";
        border = "#a89984ff";
      };
    };
  };
}


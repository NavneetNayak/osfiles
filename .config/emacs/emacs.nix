{ pkgs, lib, config, ... }: 
let 
  config = builtins.readFile ./config.el;
in {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;

    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.nixfmt
      epkgs.evil
    ];

    extraConfig = config;
  };
}

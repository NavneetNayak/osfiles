{
  description = "Navneet's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-apple-silicon = {
      url = "github:tpwrules/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-apple-silicon, home-manager, zen-browser, neovim, ... }@inputs:
  {
    nixosConfigurations = {
      acai = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          {
            nixpkgs.overlays = [
              nixos-apple-silicon.overlays.default
            ];
            nixpkgs.config.allowUnfree = true;
          }

          nixos-apple-silicon.nixosModules.default
          ./hosts/common/bluetooth.nix
          ./hosts/common/configuration.nix
          ./hosts/common/display-manager.nix
          ./hosts/common/networking.nix
          ./hosts/common/environment.nix
          ./hosts/common/users.nix

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.navneetnayak = import ./.config/home.nix;

            home-manager.extraSpecialArgs = { 
              inherit inputs;
              system = "aarch64-linux";
            };
          }

          ./hosts/acai/asahi-hardware.nix
          ./hosts/acai/boot.nix
          ./hosts/acai/environment.nix
          ./hosts/acai/hardware-configuration.nix
        ];
      };
    };
  };
}

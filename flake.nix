{
  description = "Navneet's NixOS config";

  inputs = {    
    nixos-apple-silicon.url = "github:tpwrules/nixos-apple-silicon";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";

    neovim.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixos-apple-silicon, home-manager, neovim, ... }@inputs: 
  let
    system = "aarch64-linux";
  
    nixpkgs = nixos-apple-silicon.inputs.nixpkgs;

    heliumOverlay = final: prev: {
      helium = prev.callPackage ./.config/helium.nix { };
    };

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [ 
        nixos-apple-silicon.overlays.default 
        heliumOverlay

        (final: prev: {
          unstable = import inputs.nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        })
      ];
    };
  in
  {
    nixosConfigurations = {
      acai = nixpkgs.lib.nixosSystem {
        inherit system pkgs; 
        modules = [
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

            home-manager.extraSpecialArgs = { inherit inputs system; };
          }
          
          ./hosts/acai/asahi-hardware.nix
          ./hosts/acai/boot.nix
          ./hosts/acai/touchbar.nix

          ./hardware-configuration.nix
        ];
      };
    };
  };
}

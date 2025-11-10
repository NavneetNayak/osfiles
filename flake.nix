{
  description = "Navneet's NixOS config";

  inputs = {    
    nixos-apple-silicon.url = "github:tpwrules/nixos-apple-silicon";
    home-manager.url = "github:nix-community/home-manager";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixos-apple-silicon, home-manager, zen-browser, ... }@inputs: 
  let
    system = "aarch64-linux";
  
    nixpkgs = nixos-apple-silicon.inputs.nixpkgs;

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [ nixos-apple-silicon.overlays.default ];
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

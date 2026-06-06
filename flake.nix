{
  description = "NixOS configuration for RK3588";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    {
      nixosConfigurations = {
        orangepi5plus = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = {
            inherit nixpkgs;
          };

          modules = [
            ./sdcard.nix
            ./hardware-configuration.nix
            ./configuration.nix
          ];
        };
      };
    }
    // flake-utils.lib.eachDefaultSystem (system: {
      packages = {
        sdImage = self.nixosConfigurations.orangepi5plus.config.system.build.sdImage;
      };
    });
}

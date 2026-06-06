{
  description = "NixOS configuration for RK3588";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    systemn = {
      url = "github:Dietr1ch/systemn";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    id.url = "github:Dietr1ch/id";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      nixos-hardware,
      systemn,
      id,
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

            # NixOS Hardware
            # ==============
            # SSD
            nixos-hardware.nixosModules.common-pc-ssd # ~/Projects/nixos-hardware/common/pc/ssd/default.nix

            # Id
            # ==
            id.locations-cl-valle_nevado # ~/Projects/id/locations/cl/valle_nevado.nix
            id.users # ~/Projects/id/users/default.nix
            id.users-adaroch # ~/Projects/id/users/adaroch.nix
            id.users-ivonne # ~/Projects/id/users/ivonne.nix
            id.users-ninis # ~/Projects/id/users/ninis.nix

            # SystemN  ~/Projects/systemn/flake.nix
            # =======
            # Hardware
            systemn.nixosModules.hardware # ~/Projects/systemn/hardware/default.nix
            systemn.nixosModules.hardware-memtest # ~/Projects/systemn/hardware/memtest.nix
            systemn.nixosModules.hardware-phone # ~/Projects/systemn/hardware/phone.nix
            # UNSUPPORTED: systemn.nixosModules.hardware-printing # ~/Projects/systemn/hardware/printing.nix
            systemn.nixosModules.hardware-scanning # ~/Projects/systemn/hardware/scanning.nix

            # System
            systemn.nixosModules.system # ~/Projects/systemn/system/default.nix
            systemn.nixosModules.system-base-hardware_information # ~/Projects/systemn/system/base/hardware_information.nix
            systemn.nixosModules.system-input # ~/Projects/systemn/system/input/default.nix
            systemn.nixosModules.system-input-keyboard-dvorak # ~/Projects/systemn/system/input/keyboard/dvorak.nix
            systemn.nixosModules.system-input-leap # ~/Projects/systemn/system/input/leap.nix
            systemn.nixosModules.system-networking # ~/Projects/systemn/system/networking/default.nix
            systemn.nixosModules.system-networking-connectivity-zerotier # ~/Projects/systemn/system/networking/connectivity/zerotier.nix
            systemn.nixosModules.system-security # ~/Projects/systemn/system/security/default.nix
            systemn.nixosModules.system-security-yubikey # ~/Projects/systemn/system/security/yubikey.nix;
            # systemn.nixosModules.system-updates # ~/Projects/systemn/system/updates.nix

            # Server
            systemn.nixosModules.server-database-postgres # ~/Projects/systemn/server/database/postgres.nix
            systemn.nixosModules.server-grafana # ~/Projects/systemn/server/grafana.nix
            systemn.nixosModules.server-monero # ~/Projects/systemn/server/monero.nix
            systemn.nixosModules.server-nix_serve # ~/Projects/systemn/server/nix-serve.nix
            systemn.nixosModules.server-prometheus # ~/Projects/systemn/server/prometheus.nix
            systemn.nixosModules.server-transmission # ~/Projects/systemn/server/transmission.nix
            systemn.nixosModules.server-web # ~/Projects/systemn/server/web.nix

            # Configuration
            # =============
            ./secrets # ./secrets/default.nix
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

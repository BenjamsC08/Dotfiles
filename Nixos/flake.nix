{
  description = "24.11 flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.mySystem = nixpkgs.lib.nixosSystem {
      system = system;
      modules = [
        ./configuration.nix
        # Vous pouvez ajouter d'autres modules si besoin.
      ];
    };
  };
}

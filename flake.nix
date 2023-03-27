{
  description = "NixOS configuration";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = inputs @ { self, nixpkgs }:
    let system = "x86_64-linux"; in {
      nixosConfigurations = {
        nix-vm = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./nix-vm/configuration.nix
          ];
        };
        nix-container = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./nix-container/configuration.nix
          ];
        };

      };
    };
}

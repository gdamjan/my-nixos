{
  description = "NixOS configuration";

  inputs.nixpkgs.url = "nixpkgs/nixos-24.05";

  outputs = inputs @ { self, nixpkgs }:
    let
      system = "x86_64-linux";
      specialArgs = { inherit self inputs; };
    in {
      nixosConfigurations = {
        nix-vm = nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = [
            ./common.nix
            ./nix-vm/configuration.nix
          ];
        };
        nix-container = nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = [
            ./common.nix
            ./nix-container/configuration.nix
          ];
        };
      };
    };
}

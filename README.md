# my nixos configs

I'll dump here the configuration files for my nixos machines (virtual, physical, containers), for safe keeping


## Usage

to rebuild the system, just do as ever:
```
nixos-rebuild boot --no-update-lock-file
```
it'll pick up the `nixosConfigurations.nix-vm` flake output
automatically, based on the hostname which is `nix-vm`.


alternatively, you can use:
```
nixos-rebuild boot --flake /some/path#nix-vm
```

to update the inputs, do:
```
nix flake update --commit-lock-file
```

# hetznixkube

Build system as a flake:
```
nixos-rebuild build --flake .#hetztest
```
or without flake:
```
nixos-rebuild build --file . --attr nixosConfigurations.hetztest
```

# Build a vm

```sh
nix-build -A vm nixos.nix
```

# Run

```sh
./result/bin/run-nixos-vm
```

# Build a bootable iso image

```sh
nix-build -A iso nixos.nix
```

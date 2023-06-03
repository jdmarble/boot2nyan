# nixos-generators test

This is me learning how to `nixos-generators` to create live ISO images.

## Build

```sh
nix build
```

## Run

```sh
qemu-system-x86_64 -m 1024 -cdrom result/iso/nixos.iso
```


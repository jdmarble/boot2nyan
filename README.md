# Boot2nyan

A NixOS spin that boots to [nyancat](https://github.com/klange/nyancat).

## Build

Enable flakes. For example, in your `~/.config/nix/nix.conf`:

```ini
experimental-features = nix-command flakes
```

```sh
nix build
```

## Run

You can boot the image in qemu:

```sh
qemu-system-x86_64 -m 1024 -cdrom result/iso/nixos.iso
```

You can `dd` it to a USB stick and boot on metal.

## Pre-commit checks

This repository is configured with [pre-commit](https://pre-commit.com/) checks to enforce consistent style and other things.

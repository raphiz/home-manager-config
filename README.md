# Home-Manager configuration

This repository contains my personal [home-manager](https://github.com/nix-community/home-manager) configuration. It is based on [Nix flakes](https://nixos.wiki/wiki/Flakes).

## Switching to a new configuration

```bash
home-manager --flake . switch
```

## Updating

To update the Nix flake lock file:

```bash
nix flake update
```

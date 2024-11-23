# nix-configs

A repository containing the nix configuraions for my personal computer. Derived from the [nix-starter-configs](https://github.com/Misterio77/nix-starter-configs).

* AMD 3600 XT 8-core CPU
* nVidia 2080 Super

## Personal Notes

Build new nixOS release

```bash
# Find any warnings
nix flake check
# Nix flake buid
nixos-rebuild build --flake .#overkill
# Finally, switch to the new system
sudo nixos-rebuild switch --flake .#overkill
```

Update home-manager flake

```bash
# May need to get home-manager first
nix shell nixpkgs#home-manager
home-manager switch --flake .#yuvashankar@overkill
```

Clean up old nix versions

```bash
sudo nix-collect-garbage --delete-older-than 15d
```

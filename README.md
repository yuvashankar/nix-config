# nix-configs
A repository containing the nix configuraions for my personal computer. Derived from the [nix-starter-configs](https://github.com/Misterio77/nix-starter-configs).
* AMD 3600 XT 8-core CPU
* nVidia 2080 Super

# Personal Notes
Build new nixOS release

```
sudo nixos-rebuild switch --flake .#overkill
```

Update home-manager flake

```
home-manager switch --flake .#yuvashankar@overkill
```

Clean up old nix versions
```
sudo nix-collect-garbage --delete-older-than 15d
```



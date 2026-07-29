# commands to clean after configuring

```
# to show all the generations
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
# to delete all the generations other than the current one
sudo nix-collect-garbage -d
# garbage collector
sudo nix-store --gc
# depduplicate the identical files or others
sudo nix-store --optimise
```

cd ~/dotfiles

# Update dependencies
nix flake update

# Build and switch
sudo nixos-rebuild switch --flake .#nixos-btw

# If everything is OK
git add flake.lock
git commit -m "Update flake inputs"

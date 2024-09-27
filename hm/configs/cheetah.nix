{ inputs, ... }:
{ config, lib, pkgs, ... }:
#
# NOTE: This file should only contain specifics to `homeConfigurations.cheetah`
#
{
  home = {
    # username = "sam";
    username = "nix-on-droid";
    stateVersion = "23.11";
    packages = [];
    shellAliases.up = "cd ~/.config/nix-on-droid && git pull && nix flake update --commit-lock-file && nix-on-droid switch --flake .#cheetah && git push && cd -";
  };
}

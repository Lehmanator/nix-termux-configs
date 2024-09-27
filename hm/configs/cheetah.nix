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
  };
}

{ inputs, ... }:
{ config, lib, pkgs, ...}:
{
  # for Nix-on-Droid
  # nixpkgs.config = import (inputs.self + /nixpkgs-config.nix);

  # for Home Manager
  # home-manager.config.nixpkgs.config = import (inputs.self + /nixpkgs-config.nix);
  # -or-
  # home-manager.config = { pkgs, ... }: {
  #   # for Home Manager
  #   nixpkgs.config = import ../../nixpkgs-config.nix;
  #   # for commands like nix-env
  #   xdg.configFile."nixpkgs/config.nix".source = ../../nixpkgs-config.nix;
  # };
}

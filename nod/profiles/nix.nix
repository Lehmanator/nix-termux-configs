{ inputs, config, lib, pkgs, ... }:
{
  nix = {
    package = pkgs.lix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    # nixPath = [];
    # registry = {};
    # substituters = [];
    # trustedPublicKeys = [];
  };
}

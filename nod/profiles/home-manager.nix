{ inputs, self, ... }:
{ config, lib, pkgs, name, ... }:
{
  home-manager = {
    config = inputs.self.homeSuites.${name};
    # config = inputs.self + /hm/configs/${name}.nix;
    # config = { pkgs, ... }: inputs.self.homeConfigurations.${name}.config; #.config;

    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
    useUserPackages = true;

    sharedModules = (lib.mapAttrsToList (pn: pv: pv) inputs.self.homeProfiles) ++ [
      inputs.sops-nix.homeManagerModules.sops
      { home = {
          # username = lib.mkForce "sam";
          username = lib.mkForce "nix-on-droid";
          homeDirectory = "/data/data/com.termux.nix/files/home";
        };
      }
    ];

    extraSpecialArgs = {
      inherit inputs;
    };

  };
}

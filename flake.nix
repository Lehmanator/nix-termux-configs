{
  description = "Nix Termux config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
    haumea = {
      url = "github:nix-community/haumea";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, haumea, nixpkgs, home-manager, lix-module, nix-on-droid, sops-nix, ... }@inputs:
  let
    # set nixpkgs instance, it is recommended to apply `nix-on-droid.overlays.default`
    pkgs = import nixpkgs {
      system = "aarch64-linux";
      overlays = [ nix-on-droid.overlays.default ];
      config = import (self + /nixpkgs-config.nix);
    };

    loadHomeConfigs = nixpkgs.lib.mapAttrs (name: cfg: home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs; user = "sam"; };
      modules = [ { home.homeDirectory = "/data/data/com.termux.nix/files/home"; } cfg ];
    });

    loadNodConfigs = nixpkgs.lib.mapAttrs (name: cfg: nix-on-droid.lib.nixOnDroidConfiguration {
      inherit pkgs;
      home-manager-path = home-manager.outPath;
      extraSpecialArgs = { inherit inputs name; user="sam"; };
      modules = (nixpkgs.lib.mapAttrsToList (pn: pv: pv) self.nixOnDroidProfiles) ++ [
        cfg
        # lix-module.nixosModules.default
        # sops-nix.nixosModules.default
        # { home-manager.config = self.homeConfigurations.${name}.config; }
      ];
    });
  in
  {
    inherit self;
    homeConfigurations = loadHomeConfigs self.homeSuites;
    homeSuites         = haumea.lib.load { src=./hm/configs;   inputs={inherit inputs;}; };
    homeProfiles       = haumea.lib.load { src=./hm/profiles;  inputs={inherit inputs;}; };
    nixOnDroidConfigurations = loadNodConfigs self.nixOnDroidSuites;
    nixOnDroidSuites   = haumea.lib.load { src=./nod/configs;  inputs={inherit inputs;}; };
    nixOnDroidProfiles = haumea.lib.load { src=./nod/profiles; inputs={inherit inputs;}; };
    # nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
    #   inherit pkgs;
    #   modules = [
    #     lix-module.nixosModules.default
    #     sops-nix.nixosModules.default
    #     ./nod/configs/cheetah.nix
    #     # { nix.registry.nixpkgs.flake = nixpkgs; }
    #     # or import source out-of-tree modules like:
    #     # flake.nixOnDroidModules.module
    #   ] ++ nixpkgs.lib.mapAttrsToList (n: v: v) self.nixOnDroidProfiles;

    #   # list of extra special args for Nix-on-Droid modules
    #   extraSpecialArgs = {
    #     rootPath = ./.;
    #     user = "sam";
    #     inherit inputs self;
    #   };

    #   # set path to home-manager flake
    #   home-manager-path = home-manager.outPath;
    # };
  };

  nixConfig = {
  };
}

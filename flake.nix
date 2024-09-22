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

  outputs = { self, haumea, nixpkgs, home-manager, lix-module, nix-on-droid, sops-nix, ... }@inputs: {
    homeProfiles = haumea.lib.load {
      src = ./hm/profiles;
      inputs = {
        inherit inputs;
      };
    };
    homeConfigurations = {
      cheetah = home-manager.lib.homeManagerConfiguration {
        modules = [
          sops-nix.homeManagerModules.sops
          ./hm/configs/cheetah.nix
          ./hm/users/sam.nix
          ./hm/profiles
        ];
        extraSpecialArgs = {
          rootPath = ./.;
          user = "sam";
          inherit inputs self;
        };
      };
    };
    nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      modules = [
        lix-module.nixosModules.default
        sops-nix.nixosModules.default
        ./nod/configs/cheetah.nix
        ./nod/profiles
        # { nix.registry.nixpkgs.flake = nixpkgs; }
        # or import source out-of-tree modules like:
        # flake.nixOnDroidModules.module
      ];

      # list of extra special args for Nix-on-Droid modules
      extraSpecialArgs = {
        rootPath = ./.;
        user = "sam";
        inherit inputs self;
      };

      # set nixpkgs instance, it is recommended to apply `nix-on-droid.overlays.default`
      pkgs = import nixpkgs {
        system = "aarch64-linux";
        overlays = [ nix-on-droid.overlays.default ];
      };

      # set path to home-manager flake
      home-manager-path = home-manager.outPath;
    };
  };

  nixConfig = {
  };
}

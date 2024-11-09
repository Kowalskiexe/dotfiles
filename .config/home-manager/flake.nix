{
  description = "Home Manager configuration of sharpchen";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    # Names can be any
    unstablePkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    stablePkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "unstablePkgs";
    };
  };

  outputs = { stablePkgs, unstablePkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = unstablePkgs.legacyPackages.${system}; # choose unstable as pkgs
      stable = unstablePkgs.legacyPackages.${system}; # name non-default channel as you like!
    in {
      homeConfigurations."inter" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs; # export `pkgs` here, this is the only one `pkgs`
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix 
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = { inherit stable;  }; # export `stable` as arg here
      };
    };
}

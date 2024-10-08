rec {
  description = "Chrunk; Westixy's NIX conf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #nixos-cli.url = "github:water-sucks/nixos";
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;

      channels-config.allowUnfree = true;
      nixosConfiguration.default = outputs.nixosConfiguration.sotenix;
    };
}

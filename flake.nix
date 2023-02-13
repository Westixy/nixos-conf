rec {
  description = "Chrunk; Westixy's NIX conf";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    snowfall-flake = {
      url = "github:snowfallorg/flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;

      src = ./.;

      overlays = with inputs; [
				snowfall-flake.overlay
				snowfall-flake.overlays."package/flake"
			];

      nixosConfiguration.default = outputs.nixosConfiguration.sotenix;
    };
}

{ lib, pkgs, config, inputs, ... }:
{
  options.chrunk.base_utils = {
    enable = lib.mkEnableOption "Enable Base utils";
  };

  config = lib.mkIf config.chrunk.base_utils.enable {
    nix = {
      registry = {
        unstable.flake = inputs.unstable;
      };
      settings.experimental-features = [ "nix-command" "flakes" ];
    };

    fonts.fonts = with pkgs; [
      fantasque-sans-mono
      jetbrains-mono
      fira-mono
      maple-mono-NF
    ];

    environment = {
        variables = {
          NIXPKGS_ALLOW_UNFREE = "1";
        };
        systemPackages = with pkgs; [
          neovim
          starship
          bind
          host
          fish
          firefox
          neovim
          vscodium
          alacritty
          zellij
          git
          direnv
          curl
          wget
          httpie
          btop
        ];
    };
  };
}

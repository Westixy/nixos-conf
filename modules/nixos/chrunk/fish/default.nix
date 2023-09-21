{ lib, pkgs, config, ... }:
{
  options.chrunk.fish = {
    enable = lib.mkEnableOption "Enable fish shell";
  };

  config = lib.mkIf config.chrunk.fish.enable {

    users = {
      defaultUserShell = pkgs.fish;
    };
    programs.fish = {
      enable = true;
      promptInit = ''
        starship init fish | source
        function fish_greeting
          ${pkgs.internal.joky-motd}/bin/joky-motd
        end
      '';
      shellAliases = {
        ls = "exa";
        ll = "exa -l";
        la = "exa -la";
        lt = "exa -laTL2";
        code = "codium";
        c = "codium";
      };
      shellAbbrs = {
        cls = "clear";
        f = "flake";
      };
    };

    environment.systemPackages = with pkgs; [
      sqlite
      xclip
      exa
      jq
      lolcat
      boxes
      internal.joky-motd
    ];
  };
}

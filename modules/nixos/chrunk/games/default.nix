{ lib, pkgs, config, inputs, ... }:
{
  options.chrunk.games = {
    enable = lib.mkEnableOption "Enable Games engine";
  };

  config = lib.mkIf config.chrunk.games.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;

    };
    programs.gamemode.enable = true;
    environment.systemPackages = [ 
      pkgs.mangohud
      pkgs.protonup
    ];
    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/sote/.steam/root/compatibilitytools.d";
    };
    service.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      modesetting.enable = true;
      prime = {
        sync.enable = true;
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    

  };
}


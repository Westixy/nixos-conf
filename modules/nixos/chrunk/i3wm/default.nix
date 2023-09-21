{ lib, pkgs, config, ... }:
{
  options.chrunk.i3wm = {
    enable = lib.mkEnableOption "Enable Base utils";
  };

  config = lib.mkIf config.chrunk.base_utils.enable {
    
  };
}


{ lib, pkgs, config, ... }:
{
  options.chrunk.neovim = {
    enable = lib.mkEnableOption "Enable neovim";
  };

  config = lib.mkIf config.chrunk.neovim.enable {

    # You'll need to run `:PackerInstall` on fist nvim boot
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      withNodeJs = true;
      withPython3 = true;
      withRuby = true;
      configure = {
        customRC = ''
          lua require('init')
        '';
        packages.myVimPackage.start = with pkgs; [
          vimPlugins.packer-nvim 
          (pkgs.vimUtils.buildVimPlugin {
            name = "config";
            src = ./config;
          })
        ];
      };
    };
    environment.systemPackages = [
      pkgs.gcc pkgs.cargo
    ];
  };
}

{ lib, pkgs, config, ... }:
{
  options.chrunk.neovim = {
    enable = lib.mkEnableOption "Enable neovim";
  };

  config = lib.mkIf config.chrunk.neovim.enable {

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        withNodeJs = true;
        withPython3 = true;
        withRuby = true;
        #plugins = [ pkgs.vimPlugins.packer-nvim ];
        #extraConfig = ''luafile $HOME/.config/nvim/lua/init.lua'';
    };

    #users.users.sote.home.file.".config/nvim/lua".source = ./lua_config;
  };
}

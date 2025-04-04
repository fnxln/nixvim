{ config, lib, ... }:
{
  options = {
    codecompletion.enable = lib.mkEnableOption "Enable codecompletion module";
  };
  config = lib.mkIf config.codecompletion.enable {
    plugins.codecompletion = {
      enable = true;
      luaConfig = { };

    };

  };

}

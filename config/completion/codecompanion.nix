{ config, lib, ... }:
{
  options = {
    codecompanion.enable = lib.mkEnableOption "Enable codecompletion module";
  };
  config = lib.mkIf config.codecompanion.enable {
    plugins.codecompanion = {
      enable = true;
      luaConfig = { };
    };
  };

}

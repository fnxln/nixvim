{ config, lib, ... }:
{
  options = {
    codecompanion.enable = lib.mkEnableOption "Enable codecompletion module";
  };
  config = lib.mkIf config.codecompanion.enable {
    plugins.codecompanion = {
      enable = true;
      settings = {
        adapters = {
          openai = {
            __raw = ''
              function()
                return require("codecompanion.adapters").extend("openai", {
                  env = {
                    url = "cmd:cat ~/.secret/openai",
                  },
                  schema = {
                    model = {
                      default = "gpt-4o"
                    }
                  }
                })
              end
            '';
          };
        };
        strategies = {
          agent = {
            adapter = "openai";
          };
          chat = {
            adapter = "openai";
          };
          inline = {
            adapter = "copilot";
          };
        };
        display = {
          action_palette = {
            provider = "default";
          };
          chat = {
            window = {
              layout = "vertical";
            };
          };
        };
      };
    };
  };

}

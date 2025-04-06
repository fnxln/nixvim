{ config, lib, ... }:
{
  options = {
    codecompanion.enable = lib.mkEnableOption "Enable codecompletion module";
  };
  config = lib.mkIf config.codecompanion.enable {

    keymaps = [
      {
        mode = [
          "n"
          "v"
        ];
        key = "<C-a>";
        action = "<cmd>CodeCompanionActions<cr>";
      }
      {
        mode = [
          "n"
          "v"
        ];

        key = "<LocalLeader>a";
        action = "<cmd>CodeCompanionChat Toggle<cr>";
      }
      {
        mode = "v";
        key = "ga";
        action = "<cmd>CodeCompanionChat Add<cr>";
      }
    ];

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
        opts = {
          language = "Brazilian Portuguese";

        };
        display = {
          action_palette = {
            provider = "telescope";
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

{ lib, config, ... }:
{
  options = {
    chatgpt.enable = lib.mkEnableOption "Enable Chat GPT module";
  };
  config = lib.mkIf config.copilot.enable {
    plugins.chatgpt = {
      enable = true;
      settings = {
        aanswer_sign = "ﮧ";
        chat_layout = {
          position = "50%";
          relative = "editor";
        };
        keymaps = {
          close = [
            "<C-c>"
          ];
          submit = "<C-s>";
        };
        loading_text = "loading";
        max_line_length = 120;
        openai_edit_params = {
          model = "code-davinci-edit-001";
          temperature = 0;
        };
        openai_params = {
          frequency_penalty = 0;
          max_tokens = 300;
          model = "gpt-4o-latest";
          presence_penalty = 0;
        };
        question_sign = "";
        welcome_message = "Hello world";
        yank_register = "+";
      };
    };
  };
}

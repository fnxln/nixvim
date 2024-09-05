_: {
  plugins.chatgpt = {
    enable = true;
    settings = {
      openai_params = {
        model = "gpt-4o-2024-08-06";
        max_tokens = 300;
      };
      api_key_cmd = "cat ~/.chat_key";
      extra_curl_params = [];
    };
  };
  keymaps = [
    {
      key = "<leader>gt";
      action = "<CMD>ChatGPT<CR>";
      options.desc = "Toggle ChatGPT Chat Window";
    }
    {
      key = "<leader>ge";
      action = "<CMD>ChatGPTEditWithInstructions<CR>";
      options.desc = "Toggle ChatGPT Edit Window";
    }
    {
      key = "<leader>g<tab>";
      action = "<CMD>ChatGPTCompleteCode<CR>";
      options.desc = "ChatGPT Complete Code";
    }
  ];
}

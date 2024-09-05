_: {
  plugins.chatgpt = {
    enable = true;
    settings = {
      openai_params = {
        model = "gpt-4o";
        max_tokens = 16380;
      };
      api_key_cmd = "cat ~/.chat_key";
      extra_curl_params = [];
    };
  };
}

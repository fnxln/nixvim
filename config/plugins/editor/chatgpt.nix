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
}

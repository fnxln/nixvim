_: {
  plugins.chatgpt = {
    enable = true;
    settings = {
      openai_params = {
        model = "gpt-4o";
      };
      api_key_cmd = "cat ~/.chat_key";
      extra_curl_params = [];
    };
  };
}

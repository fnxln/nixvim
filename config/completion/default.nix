{
  lib,
  config,
  ...
}:
{
  imports = [
    ./cmp.nix
    ./codeium.nix
    ./chatgpt.nix
    ./copilot.nix
    ./copilot-chat.nix
    ./lspkind.nix
  ];

  options = {
    completion.enable = lib.mkEnableOption "Enable completion module";
  };
  config = lib.mkIf config.completion.enable {
    cmp.enable = lib.mkDefault true;
    codeium.enable = lib.mkDefault false;
    copilot.enable = lib.mkDefault true;
    copilot-chat.enable = lib.mkDefault true;
    chatgpt.enable = lib.mkDefault true;
    lspkind.enable = lib.mkDefault true;
  };
}

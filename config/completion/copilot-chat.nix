{ lib, config, ... }:
{
  options = {
    copilot-chat.enable = lib.mkEnableOption "Enable Copilot-Chat module";
  };
  config = lib.mkIf config.copilot.enable {
    plugins.copilot-chat = {
      enable = true;
      settings = {
        answer_header = "## Copilot ";
        auto_follow_cursor = true;

        auto_insert_mode = true;
        context = "buffers";
        error_header = "## Error ";
        mappings = {
          close = {
            insert = "<C-c>";
            normal = "q";
          };
          complete = {
            detail = "Use @<Tab> or /<Tab> for options.";
            insert = "<Tab>";
          };
        };
        prompts = {

          Commit = {
            prompt = "Escreva uma mensagem de commit para a alteração com a convenção do commitizen. Certifique-se de que o título tenha no máximo 50 caracteres e a mensagem esteja quebrada em 72 caracteres. Envolva toda a mensagem em um bloco de código com a linguagem gitcommit.";
            selection = "require('CopilotChat.select').gitdiff";
          };
          CommitStaged = {
            prompt = "Escreva uma mensagem de commit para a alteração com a convenção do commitizen. Certifique-se de que o título tenha no máximo 50 caracteres e a mensagem esteja quebrada em 72 caracteres. Envolva toda a mensagem em um bloco de código com a linguagem gitcommit.";
            selection = ''
              function(source)
                return select.gitdiff(source, true)
              end
            '';
          };
          Docs = {
            prompt = "/COPILOT_GENERATE Por favor, adicione um comentário de documentação para a seleção.";
          };
          Explain = {
            prompt = "/COPILOT_EXPLAIN Escreva uma explicação para a seleção ativa em parágrafos de texto.";
          };
          Fix = {
            prompt = "/COPILOT_GENERATE Há um problema neste código. Reescreva o código para mostrar com o problema corrigido.";
          };
          FixDiagnostic = {
            prompt = "Por favor, ajude com o seguinte problema de diagnóstico no arquivo:";
            selection = "require('CopilotChat.select').diagnostics";
          };
          Optimize = {
            prompt = "/COPILOT_GENERATE Otimize o código selecionado para melhorar o desempenho e a legibilidade.";
          };
          Review = {
            callback = ''
              function(response, source)
                -- veja config.lua para implementação
              end
            '';
            prompt = "/COPILOT_REVIEW Revise o código selecionado.";
          };
          Tests = {
            prompt = "/COPILOT_GENERATE Por favor, gere testes para o meu código.";
          };
        };
        question_header = "## User ";
        show_help = false;
      };
    };
  };
}

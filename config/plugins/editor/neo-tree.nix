{
  plugins.neo-tree = {
    enable = true;
    sources = ["filesystem" "buffers" "git_status" "document_symbols"];
    addBlankLineAtTop = false;

    filesystem = {
      bindToCwd = false;
      followCurrentFile = {
        enabled = true;
      };
    };
    window = {
      mappings = {
        "l" = "open";
        "h" = "close_node";
        "<space>" = "none";
        "Y" = {
          function = ''            { state, ... }:
                        let
                          node = state.tree.get_node;
                          path = node.get_id;
                        in
                        vim.fn.setreg("+", path, "c");
          '';
          desc = "Copy Path to Clipboard";
        };
        "O" = {
          function = ''            { state, ... }:
                        require("lazy.util").open(state.tree.get_node().path, { system = true });
          '';
          desc = "Open with System Application";
        };
      };
    };

    defaultComponentConfigs = {
      indent = {
        withExpanders = true;
        expanderCollapsed = "";
        expanderExpanded = " ";
        expanderHighlight = "NeoTreeExpander";
      };

      gitStatus = {
        symbols = {
          added = " ";
          conflict = "󰩌 ";
          deleted = "󱂥";
          ignored = " ";
          modified = " ";
          renamed = "󰑕";
          staged = "󰩍";
          unstaged = "";
          untracked = "";
        };
      };
    };
  };

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options = {desc = "Open/Close Neotree";};
    }
  ];
}

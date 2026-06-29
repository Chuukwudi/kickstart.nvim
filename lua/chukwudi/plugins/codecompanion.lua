-- CodeCompanion.nvim: AI chat and agents in Neovim
-- Uses Claude Code CLI via ACP — authenticate with: claude setup-token (or ANTHROPIC_API_KEY)
return {
  "olimorris/codecompanion.nvim",
  version = "^19.0.0",
  cmd = {
    "CodeCompanion",
    "CodeCompanionChat",
    "CodeCompanionActions",
    "CodeCompanionCLI",
  },
  keys = {
    { "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle AI chat" },
    { "<leader>ac", "<cmd>CodeCompanionChat<cr>", desc = "Open AI chat", mode = { "n", "v" } },
    { "<leader>ab", "<cmd>CodeCompanionCLI<cr>", desc = "Open Claude Code CLI" },
    { "<leader>ap", "<cmd>CodeCompanion<cr>", desc = "AI inline prompt", mode = { "n", "v" } },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
  },
  opts = {
    adapters = {
      acp = {
        claude_code = function()
          return require("codecompanion.adapters").extend("claude_code", {
            handlers = {
              auth = function(self)
                local token = self.env_replaced and self.env_replaced.CLAUDE_CODE_OAUTH_TOKEN
                if token and token ~= "" then
                  vim.env.CLAUDE_CODE_OAUTH_TOKEN = token
                end
                -- Claude CLI auth lives in ~/.claude when no token env is set
                return true
              end,
              form_messages = function(self, messages, capabilities)
                local helpers = require("codecompanion.adapters.acp.helpers")
                local blocks = helpers.form_messages(self, messages, capabilities)
                blocks = vim.tbl_filter(function(block)
                  if not block then
                    return false
                  end
                  if block.type == "text" then
                    return block.text and block.text ~= ""
                  end
                  return true
                end, blocks)
                if #blocks == 0 then
                  return { { type = "text", text = "<prompt></prompt>" } }
                end
                return blocks
              end,
            },
          })
        end,
      },
    },
    display = {
      diff = {
        enabled = true,
        threshold_for_chat = 40,
        window = {
          width = function()
            return math.min(120, vim.o.columns - 4)
          end,
          height = function()
            return vim.o.lines - 6
          end,
        },
      },
    },
    interactions = {
      chat = {
        adapter = "claude_code",
        opts = {
          blank_prompt = "<prompt></prompt>",
          completion_provider = "cmp",
        },
        tools = {
          opts = {
            notify_on_approval = true,
          },
        },
      },
      -- Inline edits use the HTTP API (not Claude Code CLI). Set ANTHROPIC_API_KEY.
      inline = {
        adapter = {
          name = "anthropic",
          model = "claude-haiku-4-5",
        },
      },
      cli = {
        agent = "claude_code",
        agents = {
          claude_code = {
            cmd = "claude",
            args = {},
            description = "Claude Code CLI",
            provider = "terminal",
          },
        },
      },
    },
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)

    local keymap = vim.keymap.set

    keymap("n", "<leader>gg", function()
      require("telescope.builtin").git_status()
    end, { desc = "Git status (changed files)" })

    keymap("n", "<leader>gh", function()
      if pcall(require, "gitsigns") then
        require("gitsigns").diffthis()
      else
        vim.cmd.diffthis()
      end
    end, { desc = "Diff current file vs git index" })
  end,
}

-- CodeCompanion.nvim: AI chat and agents in Neovim
-- Uses Claude Code CLI via ACP — authenticate with: claude setup-token (or ANTHROPIC_API_KEY)
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'nvim-lua/plenary.nvim',
  {
    src = gh 'olimorris/codecompanion.nvim',
    version = vim.version.range '^19.0.0',
  },
}

require('codecompanion').setup {
  adapters = {
    acp = {
      claude_code = function()
        return require('codecompanion.adapters').extend('claude_code', {
          handlers = {
            auth = function(self)
              local token = self.env_replaced and self.env_replaced.CLAUDE_CODE_OAUTH_TOKEN
              if token and token ~= '' then
                vim.env.CLAUDE_CODE_OAUTH_TOKEN = token
              end
              -- Claude CLI auth lives in ~/.claude when no token env is set
              return true
            end,
            form_messages = function(self, messages, capabilities)
              local helpers = require('codecompanion.adapters.acp.helpers')
              local blocks = helpers.form_messages(self, messages, capabilities)
              blocks = vim.tbl_filter(function(block)
                if not block then return false end
                if block.type == 'text' then
                  return block.text and block.text ~= ''
                end
                return true
              end, blocks)
              if #blocks == 0 then
                return { { type = 'text', text = '<prompt></prompt>' } }
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
        width = function() return math.min(120, vim.o.columns - 4) end,
        height = function() return vim.o.lines - 6 end,
      },
    },
  },
  interactions = {
    chat = {
      adapter = 'claude_code',
      opts = {
        blank_prompt = '<prompt></prompt>',
      },
      tools = {
        opts = {
          notify_on_approval = true,
        },
      },
    },
    cli = {
      agent = 'claude_code',
      agents = {
        claude_code = {
          cmd = 'claude',
          args = {},
          description = 'Claude Code CLI',
          provider = 'terminal',
        },
      },
    },
  },
}

vim.keymap.set('n', '<leader>cc', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'Toggle AI [C]hat' })
vim.keymap.set('n', '<leader>ca', '<cmd>CodeCompanionChat<cr>', { desc = 'Open AI [C]hat' })
vim.keymap.set('n', '<leader>ci', '<cmd>CodeCompanionCLI<cr>', { desc = 'Open Claude Code [C]LI' })
vim.keymap.set('v', '<leader>ca', '<cmd>CodeCompanionChat<cr>', { desc = 'Chat about visual selection' })

vim.keymap.set('n', '<leader>cg', function()
  require('telescope.builtin').git_status()
end, { desc = 'Git status (changed files)' })

vim.keymap.set('n', '<leader>cd', function()
  if pcall(require, 'gitsigns') then
    require('gitsigns').diffthis()
  else
    vim.cmd.diffthis()
  end
end, { desc = 'Diff current file vs git index' })

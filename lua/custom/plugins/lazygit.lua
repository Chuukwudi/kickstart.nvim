-- lazygit.nvim: run lazygit in a floating window (requires lazygit CLI on PATH)
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'kdheepak/lazygit.nvim' }

vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = 'Open LazyGit' })
vim.keymap.set('n', '<leader>lG', '<cmd>LazyGitFilterCurrentFile<cr>', { desc = 'LazyGit (current file)' })

require('which-key').add {
  { '<leader>l', group = 'Lazy[G]it' },
  { '<leader>lg', desc = 'Open LazyGit' },
  { '<leader>lG', desc = 'LazyGit (current file)' },
}

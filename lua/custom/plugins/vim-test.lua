-- vim-test: run tests from Neovim
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'vim-test/vim-test' }

vim.cmd [[
  function! BufferTermStrategy(cmd)
    exec 'te ' . a:cmd
  endfunction

  let g:test#custom_strategies = {'bufferterm': function('BufferTermStrategy')}
  let g:test#strategy = 'bufferterm'
]]

vim.keymap.set('n', '<leader>Tf', '<cmd>TestFile<cr>', { silent = true, desc = 'Run this file' })
vim.keymap.set('n', '<leader>Tn', '<cmd>TestNearest<cr>', { silent = true, desc = 'Run nearest test' })
vim.keymap.set('n', '<leader>Ta', '<cmd>TestSuite<cr>', { silent = true, desc = 'Run all tests' })
vim.keymap.set('n', '<leader>Tl', '<cmd>TestLast<cr>', { silent = true, desc = 'Run last test' })

require('which-key').add {
  { '<leader>T', group = '[T]est' },
  { '<leader>Tf', desc = 'Run this file' },
  { '<leader>Tn', desc = 'Run nearest test' },
  { '<leader>Ta', desc = 'Run all tests' },
  { '<leader>Tl', desc = 'Run last test' },
}

-- oil.nvim: edit the filesystem like a buffer
-- nvim-web-devicons (if enabled) is installed in init.lua when vim.g.have_nerd_font is true
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'stevearc/oil.nvim' }
require('oil').setup {}

vim.keymap.set('n', '-', '<cmd>Oil<cr>', { desc = 'Open parent directory' })

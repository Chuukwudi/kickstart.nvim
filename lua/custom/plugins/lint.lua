-- nvim-lint: asynchronous linting
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'mfussenegger/nvim-lint' }

local lint = require 'lint'

lint.linters_by_ft = {
  elixir = { 'credo' },
}

local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    if vim.bo.modifiable then
      lint.try_lint()
    end
  end,
})

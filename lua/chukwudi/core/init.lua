require("chukwudi.core.options")
require("chukwudi.core.keymaps")

-- Highlight when yanking (copying) text
-- See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("chukwudi-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

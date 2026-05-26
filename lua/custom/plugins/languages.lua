-- Language-specific configurations and enhancements

-- Elixir-specific setup
vim.api.nvim_create_autocmd("FileType", {
  pattern = "elixir,eelixir,heex",
  callback = function()
    -- Set tab settings for Elixir
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- Rust-specific setup
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    -- Set tab settings for Rust
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Python-specific setup
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    -- Set tab settings for Python (PEP 8)
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

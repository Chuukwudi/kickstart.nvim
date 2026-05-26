# Quick Reference: Elixir, Python, Rust in Neovim

## Common Keybindings

| Key | Action |
|-----|--------|
| `<leader>f` | Format current buffer |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `K` | Show hover documentation |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `grr` | Find references |
| `]d` | Next diagnostic |
| `[d` | Previous diagnostic |
| `<leader>e` | Show diagnostic details |
| `<leader>q` | Show diagnostic list |

## Language-Specific Commands

### Python
```bash
# In Neovim
:Mason               # Check if pyright, black, isort, ruff are installed
:LspInfo             # Verify pyright is attached
:ConformInfo         # Check formatter status
```

### Rust
```bash
# In Neovim
:Mason               # Check if rust_analyzer is installed
:LspInfo             # Verify rust_analyzer is attached

# In terminal (ensure Rust toolchain is installed)
rustc --version
cargo --version
```

### Elixir
```bash
# In Neovim
:Mason               # Check if elixir-ls is installed
:LspInfo             # Verify elixirls is attached

# In terminal
elixir --version
mix --version
```

## File Extensions Supported

| Language | Extensions |
|----------|-----------|
| Python | `.py`, `.pyi` |
| Rust | `.rs` |
| Elixir | `.ex`, `.exs`, `.eex`, `.heex`, `.leex` |

## Quick Setup Checklist

- [ ] Open Neovim: `nvim`
- [ ] Wait for plugins to install automatically
- [ ] Check Mason: `:Mason` (ensure all tools are installed)
- [ ] Install language toolchains (Python, Rust, Elixir)
- [ ] Test with sample files for each language
- [ ] Verify LSP works: `:LspInfo` when editing a file
- [ ] Test formatting: `<leader>f`
- [ ] Test autocompletion: Start typing and see suggestions

## Health Check
Run `:checkhealth` in Neovim to diagnose any issues.

---
**Note**: Leader key is `<space>` in this configuration.

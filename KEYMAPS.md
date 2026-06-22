# Neovim Keymap Reference

Personal cheat sheet for this config. **Leader = `Space`**.

Press `Space` and pause to see which-key groups. Run `:Telescope keymaps` or `<Space>sk` to search all mappings live.

> **Note:** `QUICK_REFERENCE.md` lists `gd`, `K`, `]d`, `[d` — those are **not** mapped in this config. This file reflects what is actually configured.

---

## Quick index

| Prefix | Group |
|--------|-------|
| `<Space>` | Leader |
| `<Space>s` | Search (Telescope) |
| `<Space>h` | Git hunk (gitsigns) |
| `<Space>t` | Toggle |
| `<Space>b` | Buffers *(group label; see conflicts below)* |
| `<Space>T` | Test (vim-test) |
| `<Space>l` | LazyGit launcher |
| `gr` | LSP navigation (Telescope) |

---

## Core (init.lua)

### General

| Key | Mode | Action |
|-----|------|--------|
| `Esc` | Normal | Clear search highlight |
| `Esc` `Esc` | Terminal | Exit terminal mode → normal mode |
| `Ctrl+\` `Ctrl+n` | Terminal | Exit terminal mode (default fallback) |

### Buffers

| Key | Mode | Action |
|-----|------|--------|
| `[b` | Normal | Previous buffer |
| `]b` | Normal | Next buffer |
| `<Space>bd` | Normal | Delete (close) current buffer |
| `<Space><Space>` | Normal | Fuzzy-find open buffers (Telescope) |

### Windows / splits

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl+h` | Normal | Focus window left |
| `Ctrl+j` | Normal | Focus window down |
| `Ctrl+k` | Normal | Focus window up |
| `Ctrl+l` | Normal | Focus window right |

**Not mapped (built-in):**

| Action | Command / keys |
|--------|----------------|
| Horizontal split | `:split` or `Ctrl+w` `s` |
| Vertical split (right) | `:vsplit` or `Ctrl+w` `v` |
| Close window | `:close` or `Ctrl+w` `c` |
| Equalize panes | `Ctrl+w` `=` |
| Resize taller/shorter | `Ctrl+w` `+` / `Ctrl+w` `-` |
| Resize wider/narrower | `Ctrl+w` `>` / `Ctrl+w` `<` |
| Terminal horizontal | `:split \| terminal` |
| Terminal vertical | `:vsplit \| terminal` |

Mouse resize is enabled (`mouse = 'a'`): drag split dividers.

**Commented out (not active):** `Ctrl+Shift+h/j/k/l` to move windows to far edge.

### Diagnostics

| Key | Mode | Action |
|-----|------|--------|
| `<Space>q` | Normal | Open diagnostics in quickfix list |

Jumping diagnostics (`]d` / `[d`) is **not** mapped. Diagnostic floats auto-open when using `vim.diagnostic.goto_next` / `goto_prev` if you add those mappings later.

---

## Search — Telescope

| Key | Mode | Action |
|-----|------|--------|
| `<Space>sf` | Normal | Find files |
| `<Space>sg` | Normal | Live grep (search file contents, project-wide) |
| `<Space>sw` | Normal, Visual | Grep for word under cursor / selection |
| `<Space>/` | Normal | Fuzzy search in **current buffer** |
| `<Space>s/` | Normal | Live grep in **open buffers only** |
| `<Space>sh` | Normal | Search help tags |
| `<Space>sk` | Normal | Search keymaps |
| `<Space>ss` | Normal | Telescope picker picker |
| `<Space>sd` | Normal | Search diagnostics |
| `<Space>sr` | Normal | Resume last Telescope search |
| `<Space>s.` | Normal | Recent files |
| `<Space>sc` | Normal | Search commands |
| `<Space>sn` | Normal | Search Neovim config files |

### Inside Telescope

| Key | Mode | Action |
|-----|------|--------|
| `?` | Normal | Show picker keymaps |
| `Ctrl+/` | Insert | Show picker keymaps |
| `Ctrl+j` / `Ctrl+k` | Insert | Next / previous result |
| `Enter` | Insert | Open selection |
| `Esc` | Insert | Close picker |

---

## LSP (buffer-local, when LSP attached)

### Telescope-based navigation (`gr*` prefix)

| Key | Mode | Action |
|-----|------|--------|
| `grd` | Normal | Go to definition |
| `grD` | Normal | Go to declaration |
| `grr` | Normal | References |
| `gri` | Normal | Implementations |
| `grt` | Normal | Type definition |
| `gO` | Normal | Document symbols |
| `gW` | Normal | Workspace symbols |

After jumping: `Ctrl+t` returns to previous location.

### LSP actions

| Key | Mode | Action |
|-----|------|--------|
| `grn` | Normal | Rename symbol |
| `gra` | Normal, Visual | Code action |
| `grD` | Normal | Declaration *(same key as above — declaration)* |

### LSP toggle

| Key | Mode | Action |
|-----|------|--------|
| `<Space>th` | Normal | Toggle inlay hints *(when supported)* |

**Not mapped:** `K` (hover), `gd` (definition without picker). Use `grd` instead.

Cursor resting on a symbol highlights references automatically (no keymap).

---

## Formatting — conform.nvim

| Key | Mode | Action |
|-----|------|--------|
| `<Space>f` | Normal, Visual | Format buffer (async) |

Formats on save for: Python, Rust, Elixir, Lua, and other configured filetypes.

---

## Completion — blink.cmp (insert mode)

Preset: `default`

| Key | Action |
|-----|--------|
| `Ctrl+y` | Accept completion |
| `Ctrl+Space` | Open completion menu (or docs if open) |
| `Ctrl+n` / `Ctrl+p` | Next / previous item |
| `Up` / `Down` | Next / previous item |
| `Ctrl+e` | Close menu |
| `Ctrl+k` | Toggle signature help |
| `Tab` / `Shift+Tab` | Move through snippet placeholders |

Docs can auto-show after 500ms when configured.

---

## Git — gitsigns.nvim

Buffer-local when file is tracked.

### Navigation

| Key | Mode | Action |
|-----|------|--------|
| `]c` | Normal | Next git hunk *(or next diff change in diff mode)* |
| `[c` | Normal | Previous git hunk |

### Hunk actions

| Key | Mode | Action |
|-----|------|--------|
| `<Space>hs` | Normal, Visual | Stage hunk |
| `<Space>hr` | Normal, Visual | Reset (unstage) hunk |
| `<Space>hS` | Normal | Stage entire buffer |
| `<Space>hR` | Normal | Reset entire buffer |
| `<Space>hp` | Normal | Preview hunk (popup) |
| `<Space>hi` | Normal | Preview hunk inline |
| `<Space>hb` | Normal | Blame line (full) |
| `<Space>hd` | Normal | Diff against index |
| `<Space>hD` | Normal | Diff against last commit |
| `<Space>hq` | Normal | Quickfix: hunks in this file |
| `<Space>hQ` | Normal | Quickfix: hunks in whole repo |

### Toggles

| Key | Mode | Action |
|-----|------|--------|
| `<Space>tb` | Normal | Toggle inline git blame |
| `<Space>tw` | Normal | Toggle word-level diff highlight |

### Text object

| Key | Mode | Action |
|-----|------|--------|
| `ih` | Operator, Visual | Select inner hunk *(e.g. `vih`, `dih`)* |

---

## Git UI — LazyGit

Opens in a floating terminal. Requires `lazygit` CLI on PATH.

| Key | Mode | Action |
|-----|------|--------|
| `<Space>lg` | Normal | Open LazyGit |
| `<Space>lG` | Normal | LazyGit filtered to current file |

### LazyGit in-app shortcuts (most used)

| Key | Action |
|-----|--------|
| `q` | Quit LazyGit |
| `?` | Keybindings help for current panel |
| `1`–`5` | Jump to Status / Files / Branches / Commits / Stash |
| `Tab` | Cycle panels |
| `p` | Pull current branch |
| `P` | Push current branch |
| `f` | Fetch *(Files panel or Remotes tab)* |
| `:` | Run shell command (e.g. `git fetch --all --prune`) |
| `R` | Refresh UI *(does not fetch)* |

**Files panel**

| Key | Action |
|-----|--------|
| `Space` | Stage / unstage file |
| `c` | Commit |
| `s` | Stash all |
| `S` | Stash options |

**Branches panel (`3`)**

| Key | Action |
|-----|--------|
| `]` / `[` | Switch tabs (local / remote / tags) |
| `Space` | Checkout branch |
| `c` | Checkout by name |
| `n` | New branch |
| `f` | Fast-forward from upstream |

**Remote branches:** `3` → `]` to Remotes → `Enter` on remote → select branch → `n` or `Space` to checkout.

**Stash panel (`5`)**

| Key | Action |
|-----|--------|
| `Space` | Apply stash |
| `g` | Pop stash |
| `d` | Drop stash |

---

## Git / diff — CodeCompanion helpers

| Key | Mode | Action |
|-----|------|--------|
| `<Space>cg` | Normal | Git status picker (Telescope) |
| `<Space>cd` | Normal | Diff current file vs git index |

---

## AI — CodeCompanion.nvim

| Key | Mode | Action |
|-----|------|--------|
| `<Space>cc` | Normal | Toggle AI chat |
| `<Space>ca` | Normal | Open AI chat |
| `<Space>ca` | Visual | Chat about visual selection |
| `<Space>cp` | Normal, Visual | Inline AI prompt |
| `<Space>ci` | Normal | Open Claude Code CLI (terminal) |

**Auth:** Claude Code CLI (`claude setup-token`) or `ANTHROPIC_API_KEY` for inline edits.

---

## File browser

### Neo-tree

| Key | Mode | Action |
|-----|------|--------|
| `\` | Normal | Reveal Neo-tree |
| `\` | Neo-tree | Close Neo-tree window |

### Oil.nvim

| Key | Mode | Action |
|-----|------|--------|
| `-` | Normal | Open parent directory (edit filesystem like a buffer) |

---

## Tests — vim-test

Runs in a terminal buffer (`:terminal`).

| Key | Mode | Action |
|-----|------|--------|
| `<Space>Tf` | Normal | Run test file |
| `<Space>Tn` | Normal | Run nearest test |
| `<Space>Ta` | Normal | Run full suite |
| `<Space>Tl` | Normal | Re-run last test |

---

## Debug — nvim-dap

| Key | Mode | Action |
|-----|------|--------|
| `F5` | Normal | Start / continue |
| `F1` | Normal | Step into |
| `F2` | Normal | Step over |
| `F3` | Normal | Step out |
| `F7` | Normal | Toggle DAP UI |
| `<Space>b` | Normal | Toggle breakpoint |
| `<Space>B` | Normal | Set conditional breakpoint |

DAP UI opens automatically when a debug session starts.

---

## Text objects & surround — mini.nvim

### mini.ai (extended around/inside)

Uses `aa` / `ii` suffixes for multi-line objects.

Examples:

| Key | Action |
|-----|--------|
| `va)` | Visually select around `)` |
| `cii` | Change inside with `ii` textobject |
| `yaa` | Yank around with `aa` textobject |

Works alongside built-in `i(` / `a(` etc.

### mini.surround

| Key | Action | Example |
|-----|--------|---------|
| `sa{motion}{char}` | Add surround | `saiw"` → wrap word in quotes |
| `sd{char}` | Delete surround | `sd"` → remove surrounding quotes |
| `sr{old}{new}` | Replace surround | `sr)"` → change `(` to `"` |
| `sf{char}` | Find surround (right) | |
| `sF{char}` | Find surround (left) | |
| `sh` | Highlight surround | |

---

## Operator & visual text objects (built-in + plugins)

| Key | Source | Action |
|-----|--------|--------|
| `ih` | gitsigns | Inner git hunk |
| `i(` `a(` `i"` etc. | built-in | Standard text objects |
| `ii` `aa` | mini.ai | Extended inside / around |

---

## Known conflicts & quirks

| Key | Conflict |
|-----|----------|
| `<Space>b` | **Debug:** toggle breakpoint. which-key labels `<Space>b` as "Buffers" but only `<Space>bd` is the buffer action. |
| `<Space>ca` | CodeCompanion chat only — LSP code action is `gra`, not `<Space>ca`. |
| `<Space>cd` | CodeCompanion diff helper — gitsigns diff is `<Space>hd`. |
| `<Space>th` | Toggle inlay hints — not terminal horizontal split. |
| `Ctrl+h/j/k/l` | Window focus — may conflict with some terminals; window-move maps are commented out. |

---

## Useful commands (no custom keymap)

| Task | Command |
|------|---------|
| Mason (install tools) | `:Mason` |
| LSP status | `:LspInfo` |
| Health check | `:checkhealth` |
| Which-key help | Press `<Space>` then wait |
| All keymaps | `<Space>sk` or `:Telescope keymaps` |
| Format info | `:ConformInfo` |

### Run code (terminal)

| Language | Command |
|----------|---------|
| Elixir script | `elixir file.exs` |
| Elixir tests | `mix test` or `<Space>Tf` |
| Elixir REPL | `iex -S mix` |
| Current `.exs` from Vim | `:!elixir %` |

---

## Config file map

| Topic | File |
|-------|------|
| Core, Telescope, LSP, format, completion | `init.lua` |
| gitsigns | `lua/kickstart/plugins/gitsigns.lua` |
| neo-tree | `lua/kickstart/plugins/neo-tree.lua` |
| debug | `lua/kickstart/plugins/debug.lua` |
| LazyGit | `lua/custom/plugins/lazygit.lua` |
| CodeCompanion | `lua/custom/plugins/codecompanion.lua` |
| vim-test | `lua/custom/plugins/vim-test.lua` |
| Oil | `lua/custom/plugins/oil.lua` |
| mini.ai / mini.surround | `init.lua` (mini.nvim section) |

---

*Generated from config sources. If a mapping stops working after edits, check the file listed above or run `<Space>sk`.*

# Neovim Keymaps

`<leader>` is **Space**.

## General

| Mode   | Keymap       | Description                    |
| ------ | ------------ | ------------------------------ |
| Insert | `jk`         | Exit insert mode               |
| Normal | `<leader>nh` | Clear search highlights        |
| Normal | `<leader>+` | Increment number under cursor |
| Normal | `<leader>-` | Decrement number under cursor |

## Window & Tab Management

| Mode   | Keymap       | Description                  |
| ------ | ------------ | ---------------------------- |
| Normal | `<leader>sv` | Split window vertically      |
| Normal | `<leader>sh` | Split window horizontally    |
| Normal | `<leader>se` | Make splits equal size       |
| Normal | `<leader>sx` | Close current split          |
| Normal | `<leader>sm` | Maximize/minimize a split    |
| Normal | `<leader>to` | Open new tab                 |
| Normal | `<leader>tx` | Close current tab            |
| Normal | `<leader>tn` | Go to next tab               |
| Normal | `<leader>tp` | Go to previous tab           |
| Normal | `<leader>tf` | Open current buffer in new tab |

## File Explorer (nvim-tree)

| Mode   | Keymap       | Description                            |
| ------ | ------------ | -------------------------------------- |
| Normal | `<leader>ee` | Toggle file explorer                   |
| Normal | `<leader>ef` | Toggle file explorer on current file   |
| Normal | `<leader>ec` | Collapse file explorer                 |
| Normal | `<leader>er` | Refresh file explorer                  |

## Telescope

| Mode   | Keymap       | Description                        |
| ------ | ------------ | ---------------------------------- |
| Normal | `<leader>ff` | Fuzzy find files in cwd            |
| Normal | `<leader>fr` | Fuzzy find recent files            |
| Normal | `<leader>fs` | Find string in cwd                 |
| Normal | `<leader>fc` | Find string under cursor in cwd    |
| Normal | `<leader>ft` | Find todos                         |
| Normal | `<leader>fk` | Find keymaps                       |

### Telescope (insert mode, inside picker)

| Mode   | Keymap  | Description                              |
| ------ | ------- | ---------------------------------------- |
| Insert | `<C-k>` | Move to previous result                  |
| Insert | `<C-j>` | Move to next result                      |
| Insert | `<C-q>` | Send selected to quickfix & open Trouble |
| Insert | `<C-t>` | Open Trouble for results                 |

## LSP (buffer-local, when LSP attached)

| Mode          | Keymap       | Description                              |
| ------------- | ------------ | ---------------------------------------- |
| Normal        | `gR`         | Show LSP references                      |
| Normal        | `gD`         | Go to declaration                        |
| Normal        | `gd`         | Show LSP definition                      |
| Normal        | `gi`         | Show LSP implementations               |
| Normal        | `gt`         | Show LSP type definitions                |
| Normal, Visual | `<leader>ca` | See available code actions              |
| Normal        | `<leader>rn` | Smart rename                             |
| Normal        | `<leader>D`  | Show buffer diagnostics                  |
| Normal        | `<leader>d`  | Show line diagnostics                    |
| Normal        | `[d`         | Go to previous diagnostic                |
| Normal        | `]d`         | Go to next diagnostic                    |
| Normal        | `K`          | Show documentation for item under cursor |
| Normal        | `<leader>rs` | Restart LSP                              |

## Formatting & Linting

| Mode          | Keymap       | Description                              |
| ------------- | ------------ | ---------------------------------------- |
| Normal, Visual | `<leader>mp` | Format file or range (visual mode)      |
| Normal        | `<leader>l`  | Trigger linting for current file         |

## Substitute

| Mode   | Keymap       | Description                |
| ------ | ------------ | -------------------------- |
| Normal | `<leader>r`  | Substitute with motion     |
| Normal | `<leader>rr` | Substitute line            |
| Normal | `<leader>R`  | Substitute to end of line  |
| Visual | `<leader>r`  | Substitute in visual mode  |

## Git (Gitsigns, buffer-local)

| Mode             | Keymap       | Description                    |
| ---------------- | ------------ | ------------------------------ |
| Normal           | `]h`         | Next hunk                      |
| Normal           | `[h`         | Previous hunk                  |
| Normal           | `<leader>hs` | Stage hunk                     |
| Normal           | `<leader>hr` | Reset hunk                     |
| Visual           | `<leader>hs` | Stage hunk (selection)         |
| Visual           | `<leader>hr` | Reset hunk (selection)         |
| Normal           | `<leader>hS` | Stage buffer                   |
| Normal           | `<leader>hR` | Reset buffer                   |
| Normal           | `<leader>hu` | Undo stage hunk                |
| Normal           | `<leader>hp` | Preview hunk                   |
| Normal           | `<leader>hb` | Blame line                     |
| Normal           | `<leader>hB` | Toggle line blame              |
| Normal           | `<leader>hd` | Diff this                      |
| Normal           | `<leader>hD` | Diff this vs `~`               |
| Operator, Visual | `ih`         | Gitsigns select hunk text object |

## Git (Telescope / diff)

| Mode   | Keymap       | Description                    |
| ------ | ------------ | ------------------------------ |
| Normal | `<leader>gg` | Git status (changed files)     |
| Normal | `<leader>gh` | Diff current file vs git index |

## LazyGit

| Mode   | Keymap       | Description  |
| ------ | ------------ | ------------ |
| Normal | `<leader>lg` | Open LazyGit |

## Trouble

| Mode   | Keymap       | Description                    |
| ------ | ------------ | ------------------------------ |
| Normal | `<leader>xw` | Open workspace diagnostics     |
| Normal | `<leader>xd` | Open document diagnostics      |
| Normal | `<leader>xq` | Open quickfix list             |
| Normal | `<leader>xl` | Open location list             |
| Normal | `<leader>xt` | Open todos in Trouble          |

## Todo Comments

| Mode   | Keymap | Description           |
| ------ | ------ | --------------------- |
| Normal | `]t`   | Next todo comment     |
| Normal | `[t`   | Previous todo comment |

## Sessions (auto-session)

| Mode   | Keymap       | Description                              |
| ------ | ------------ | ---------------------------------------- |
| Normal | `<leader>wr` | Restore session for cwd                  |
| Normal | `<leader>ws` | Save session for auto session root dir   |

## AI (CodeCompanion)

| Mode          | Keymap       | Description                    |
| ------------- | ------------ | ------------------------------ |
| Normal        | `<leader>at` | Toggle AI chat                 |
| Normal        | `<leader>ac` | Open AI chat                   |
| Visual        | `<leader>ac` | Chat about visual selection    |
| Normal        | `<leader>ab` | Open Claude Code CLI           |
| Normal, Visual | `<leader>ap` | AI inline prompt              |

## Treesitter Text Objects

### Select

| Keymap     | Description                          |
| ---------- | ------------------------------------ |
| `a=` / `i=` | Outer / inner assignment            |
| `l=` / `r=` | Left / right side of assignment     |
| `a:` / `i:` | Outer / inner object property       |
| `l:` / `r:` | Left / right part of object property |
| `aa` / `ia` | Outer / inner parameter/argument    |
| `ai` / `ii` | Outer / inner conditional           |
| `al` / `il` | Outer / inner loop                  |
| `af` / `if` | Outer / inner function call         |
| `am` / `im` | Outer / inner method/function definition |
| `ac` / `ic` | Outer / inner class                 |

### Swap

| Keymap         | Description                          |
| -------------- | ------------------------------------ |
| `<leader>na`   | Swap parameter/argument with next    |
| `<leader>n:`   | Swap object property with next       |
| `<leader>nm`   | Swap function with next              |
| `<leader>pa`   | Swap parameter/argument with previous |
| `<leader>p:`   | Swap object property with previous   |
| `<leader>pm`   | Swap function with previous          |

### Move (next start)

| Keymap | Description                  |
| ------ | ---------------------------- |
| `]f`   | Next function call start     |
| `]m`   | Next method/function def start |
| `]c`   | Next class start             |
| `]i`   | Next conditional start       |
| `]l`   | Next loop start              |
| `]s`   | Next scope                   |
| `]z`   | Next fold                    |

### Move (next end)

| Keymap | Description                  |
| ------ | ---------------------------- |
| `]F`   | Next function call end       |
| `]M`   | Next method/function def end |
| `]C`   | Next class end               |
| `]I`   | Next conditional end         |
| `]L`   | Next loop end                |

### Move (previous start)

| Keymap | Description                  |
| ------ | ---------------------------- |
| `[f`   | Previous function call start |
| `[m`   | Previous method/function def start |
| `[c`   | Previous class start         |
| `[i`   | Previous conditional start   |
| `[l`   | Previous loop start          |

### Move (previous end)

| Keymap | Description                  |
| ------ | ---------------------------- |
| `[F`   | Previous function call end   |
| `[M`   | Previous method/function def end |
| `[C`   | Previous class end           |
| `[I`   | Previous conditional end     |
| `[L`   | Previous loop end            |

### Repeatable motion

| Mode                    | Keymap              | Description                              |
| ----------------------- | ------------------- | ---------------------------------------- |
| Normal, Visual, Operator | `;`                | Repeat last treesitter/text motion       |
| Normal, Visual, Operator | `,`                | Repeat last motion in opposite direction |
| Normal, Visual, Operator | `f` / `F` / `t` / `T` | Find motions (repeatable with `;` / `,`) |

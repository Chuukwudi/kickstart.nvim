# Tmux Cheatsheet

Custom config: `~/.tmux.conf`

## Prefix

All custom shortcuts use **`Ctrl+a`** (not the default `Ctrl+b`).

- Press `Ctrl+a` twice to send a literal `Ctrl+a` to the shell.

---

## Sessions

| Action | Command / Shortcut |
|---|---|
| New session | `tmux new -s name` |
| List sessions | `tmux ls` |
| Attach to session | `tmux attach -t name` |
| Detach | `Ctrl+a` `d` |
| Kill session | `tmux kill-session -t name` |
| Switch session | `Ctrl+a` `s` |
| Rename session | `Ctrl+a` `$` |

Sessions are auto-saved every 15 minutes and restored on startup (tmux-continuum).

---

## Windows (tabs)

| Action | Shortcut |
|---|---|
| New window | `Ctrl+a` `c` |
| Next / prev window | `Ctrl+a` `n` / `Ctrl+a` `p` |
| Switch by number | `Ctrl+a` `0`–`9` |
| Rename window | `Ctrl+a` `,` |
| Close window | `Ctrl+a` `&` |

---

## Panes (splits)

### Custom split keys

| Action | Shortcut |
|---|---|
| Split vertical (side by side) | `Ctrl+a` `\|` |
| Split horizontal (top/bottom) | `Ctrl+a` `-` |

Both splits open in the **current pane's directory**.

### Navigation (vim-tmux-navigator)

| Action | Shortcut |
|---|---|
| Move between panes | `Ctrl+h` / `Ctrl+j` / `Ctrl+k` / `Ctrl+l` |

Works from tmux and from Neovim at pane edges — no prefix needed.

### Resize (repeatable)

Hold prefix, then press the key multiple times:

| Action | Shortcut |
|---|---|
| Resize left | `Ctrl+a` `h` |
| Resize down | `Ctrl+a` `j` |
| Resize up | `Ctrl+a` `k` |
| Resize right | `Ctrl+a` `l` |

Each press moves the border by 5 lines/columns.

### Other pane actions

| Action | Shortcut |
|---|---|
| Zoom pane (maximize / restore) | `Ctrl+a` `m` |
| Close pane | `Ctrl+a` `x` |
| Show pane numbers | `Ctrl+a` `q` |

Mouse support is enabled — you can click panes, resize borders, and scroll.

---

## Copy mode (Vi keys)

Copy mode uses **Vi bindings** (`mode-keys vi`).

| Action | Shortcut |
|---|---|
| Enter copy mode | `Ctrl+a` `[` |
| Start selection | `v` |
| Copy selection | `y` |
| Paste | `Ctrl+a` `]` |
| Exit copy mode | `q` |

Dragging with the mouse does **not** exit copy mode after selection.

---

## Config & plugins

| Action | Shortcut / Command |
|---|---|
| Reload config | `Ctrl+a` `r` |
| Command prompt | `Ctrl+a` `:` |
| Show keybindings | `Ctrl+a` `?` |
| Install plugins (first time) | `Ctrl+a` `I` |
| Save session manually (resurrect) | `Ctrl+a` `Ctrl+s` |
| Restore session manually (resurrect) | `Ctrl+a` `Ctrl+r` |

### Installed plugins

| Plugin | Purpose |
|---|---|
| [tpm](https://github.com/tmux-plugins/tpm) | Plugin manager |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | `Ctrl+hjkl` pane navigation between tmux and Neovim |
| [tmux-themepack](https://github.com/jimeh/tmux-themepack) | Theme: `powerline/default/cyan` |
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) | Save/restore sessions; captures pane contents |
| [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) | Auto-save every 15 min; restore on boot |

---

## Workflow tips

For AWS session management (`awsdev` / `awsprod`):

- **`Ctrl+a` `s`** — switch sessions quickly
- **`Ctrl+a` `m`** — zoom a pane for focused work
- **`Ctrl+hjkl`** — move between panes without leaving the keyboard

Continuum restores your layout after a restart; use **`Ctrl+a` `Ctrl+s`** before a reboot if you want a manual snapshot.

## Prefix key
All shortcuts start with `Ctrl+b` (the prefix), then the key.

---

## Sessions
| Action | Command |
|---|---|
| New session | `tmux new -s name` |
| List sessions | `tmux ls` |
| Attach to session | `tmux attach -t name` |
| Detach | `Ctrl+b d` |
| Kill session | `tmux kill-session -t name` |
| Switch session | `Ctrl+b $` (rename) / `Ctrl+b s` (list) |

## Windows (tabs)
| Action | Shortcut |
|---|---|
| New window | `Ctrl+b c` |
| Next/prev window | `Ctrl+b n` / `Ctrl+b p` |
| Switch by number | `Ctrl+b 0-9` |
| Rename window | `Ctrl+b ,` |
| Close window | `Ctrl+b &` |

## Panes (splits)
| Action | Shortcut |
|---|---|
| Split horizontal | `Ctrl+b %` |
| Split vertical | `Ctrl+b "` |
| Navigate panes | `Ctrl+b ←↑↓→` |
| Resize pane | `Ctrl+b + hold ←↑↓→` |
| Zoom pane toggle | `Ctrl+b z` |
| Close pane | `Ctrl+b x` |
| Show pane numbers | `Ctrl+b q` |

## Copy mode
| Action | Shortcut |
|---|---|
| Enter copy mode | `Ctrl+b [` |
| Start selection | `Space` |
| Copy selection | `Enter` |
| Paste | `Ctrl+b ]` |
| Exit copy mode | `q` |

## Misc
| Action | Command/Shortcut |
|---|---|
| Command prompt | `Ctrl+b :` |
| Show keybindings | `Ctrl+b ?` |
| Reload config | `Ctrl+b :` → `source-file ~/.tmux.conf` |
| Clock | `Ctrl+b t` |

---

**Tips for your workflow:** Given you use tmux heavily for AWS session management, the most critical ones are probably `Ctrl+b z` (zoom into a pane) and `Ctrl+b s` (switch between sessions) for jumping between your `awsdev`/`awsprod` contexts.
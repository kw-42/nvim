# Keybinds Reference

Leader key: `Space`

---

## General

| Mode   | Key              | Action                              |
| ------ | ---------------- | ----------------------------------- |
| Normal | `<Esc>`          | Clear search highlight              |
| Normal | `Q`              | Disabled (no-op)                    |
| Normal | `<C-d>`          | Scroll down (cursor centered)       |
| Normal | `<C-u>`          | Scroll up (cursor centered)         |
| Normal | `J`              | Join line (cursor stays in place)   |
| Normal | `n`              | Next search result (centered)       |
| Normal | `N`              | Prev search result (centered)       |

---

## Word Navigation

| Mode   | Key              | Action                              |
| ------ | ---------------- | ----------------------------------- |
| Normal | `w`              | Next word (start)                   |
| Normal | `b`              | Previous word (start)               |
| Normal | `e`              | End of word                         |
| Normal | `W`              | Next WORD (space-delimited)         |
| Normal | `B`              | Previous WORD (space-delimited)     |
| Normal | `E`              | End of WORD (space-delimited)       |
| Normal | `ge`             | Previous word (end)                 |
| Normal | `gE`             | Previous WORD (end)                 |

---

## Word Navigation

| Mode   | Key    | Action                           |
| ------ | ------ | -------------------------------- |
| Normal | `w`    | Next word (start)                |
| Normal | `b`    | Previous word (start)            |
| Normal | `e`    | End of word                      |
| Normal | `W`    | Next WORD (start)                |
| Normal | `B`    | Previous WORD (start)            |
| Normal | `E`    | End of WORD                      |
| Normal | `ge`   | End of previous word             |
| Normal | `gE`   | End of previous WORD             |
| Normal | `cw`   | Change word                      |
| Normal | `dw`   | Delete word                      |

---

## Editing

| Mode          | Key           | Action                              |
| ------------- | ------------- | ----------------------------------- |
| Normal/Visual | `<leader>y`   | Yank to system clipboard            |
| Normal        | `<leader>Y`   | Yank line to system clipboard       |
| Visual        | `<leader>p`   | Paste without losing register       |
| Normal/Visual | `<leader>d`   | Delete to void register             |
| Normal        | `<leader>s`   | Replace word under cursor (global)  |
| Normal        | `<leader>f`   | Format buffer                       |
| Normal        | `<leader>x`   | chmod +x current file               |
| Visual        | `J`           | Move selected lines down            |
| Visual        | `K`           | Move selected lines up              |

### Treesitter Text Objects

| Mode          | Key    | Action                      |
| ------------- | ------ | --------------------------- |
| Normal/Visual | `af`   | Select outer function       |
| Normal/Visual | `if`   | Select inner function       |
| Normal/Visual | `ac`   | Select outer class          |
| Normal/Visual | `ic`   | Select inner class          |
| Normal/Visual | `aa`   | Select outer parameter      |
| Normal/Visual | `ia`   | Select inner parameter      |
| Normal        | `]f`   | Next function start         |
| Normal        | `[f`   | Prev function start         |
| Normal        | `]c`   | Next class start            |
| Normal        | `[c`   | Prev class start            |

---

## Windows

| Mode   | Key           | Action                     |
| ------ | ------------- | -------------------------- |
| Normal | `<C-h>`       | Focus left window          |
| Normal | `<C-j>`       | Focus lower window         |
| Normal | `<C-k>`       | Focus upper window         |
| Normal | `<C-l>`       | Focus right window         |
| Normal | `<leader>sv`  | Split vertical             |
| Normal | `<leader>sh`  | Split horizontal           |
| Normal | `<leader>sx`  | Close current split        |

---

## Buffers

| Mode   | Key              | Action                     |
| ------ | ---------------- | -------------------------- |
| Normal | `<S-l>`          | Next buffer                |
| Normal | `<S-h>`          | Previous buffer            |
| Normal | `<leader>bd`     | Delete (close) buffer      |
| Normal | `<leader><leader>` | List open buffers (telescope) |

---

## Terminal

| Mode     | Key            | Action                         |
| -------- | -------------- | ------------------------------ |
| Normal   | `<leader>tt`   | Toggle default terminal (float) |
| Normal   | `<leader>tn`   | New horizontal terminal        |
| Normal   | `<leader>tb`   | Toggle floating terminal       |
| Normal   | `<leader>tc`   | Close focused terminal         |
| Terminal | `<Esc><Esc>`   | Exit terminal → Normal mode    |

---

## File Navigation

| Mode   | Key           | Action                                 |
| ------ | ------------- | -------------------------------------- |
| Normal | `-`           | Oil: open parent directory             |
| Normal | `<leader>-`   | Oil: floating file browser             |
| Normal | `\`           | Neo-tree: reveal current file          |
| Normal | `<leader>e`   | Neo-tree: toggle sidebar               |

### Oil (File Browser)

| Mode   | Key           | Action                                 |
| ------ | ------------- | -------------------------------------- |
| Normal | `<bs>`        | Go to parent directory                 |
| Normal | `<C-bs>`      | Close Oil                              |
| Normal | `q`           | Close Oil                              |
| Normal | `<CR>`        | Select/Open file                       |
| Normal | `-`           | Go to parent directory                 |
| Normal | `_`           | Open current working directory         |
| Normal | `g.`          | Toggle hidden files                    |

---

## Search (Telescope)

| Mode   | Key           | Action                                |
| ------ | ------------- | ------------------------------------- |
| Normal | `<leader>sf`  | Find files                            |
| Normal | `<leader>sg`  | Live grep (project)                   |
| Normal | `<leader>sw`  | Grep word under cursor                |
| Normal | `<leader>sr`  | Resume last picker                    |
| Normal | `<leader>s.`  | Recent files                          |
| Normal | `<leader>sh`  | Help tags                             |
| Normal | `<leader>sk`  | Keymaps                               |
| Normal | `<leader>ss`  | Telescope builtins                    |
| Normal | `<leader>sd`  | Diagnostics                           |
| Normal | `<leader>s/`  | Live grep in open buffers             |
| Normal | `<leader>sn`  | Search Neovim config files            |

### Telescope (Insert mode)

| Mode   | Key           | Action                                |
| ------ | ------------- | ------------------------------------- |
| Insert | `<Esc>`       | Close Telescope picker                |

---

## LSP

| Mode   | Key           | Action                        |
| ------ | ------------- | ----------------------------- |
| Normal | `gd`          | Go to definition              |
| Normal | `gr`          | References                    |
| Normal | `gI`          | Go to implementation          |
| Normal | `gD`          | Go to declaration             |
| Normal | `K`           | Hover documentation           |
| Normal | `<leader>D`   | Type definition               |
| Normal | `<leader>ds`  | Document symbols              |
| Normal | `<leader>ws`  | Workspace symbols             |
| Normal | `<leader>rn`  | Rename symbol                 |
| Normal | `<leader>ca`  | Code action                   |
| Normal | `<leader>th`  | Toggle inlay hints            |
| Normal | `<leader>q`   | Diagnostics to quickfix list  |
| Normal | `]d`          | Next diagnostic               |
| Normal | `[d`          | Prev diagnostic               |

---

## Git

| Mode   | Key           | Action                              |
| ------ | ------------- | ----------------------------------- |
| Normal | `<leader>gs`  | Git status (fugitive)               |
| Normal | `<leader>gD`  | Git diff (fugitive)                 |
| Normal | `<leader>gl`  | Git log oneline (fugitive)          |
| Normal | `<leader>gP`  | Git push (fugitive)                 |
| Normal | `<leader>gF`  | Git pull (fugitive)                 |
| Normal | `]h`          | Next hunk                           |
| Normal | `[h`          | Prev hunk                           |
| Normal | `<leader>gp`  | Preview hunk                        |
| Normal | `<leader>ga`  | Stage hunk                          |
| Visual | `<leader>ga`  | Stage selected lines                |
| Normal | `<leader>gA`  | Stage entire buffer                 |
| Normal | `<leader>gu`  | Undo stage hunk                     |
| Normal | `<leader>gb`  | Blame current line (full)           |
| Normal | `<leader>gB`  | Toggle line blame                   |
| Normal | `<leader>gd`  | Diff current file                   |

---

## Completion (Insert mode)

| Mode           | Key          | Action                         |
| -------------- | ------------ | ------------------------------ |
| Insert         | `<C-n>`      | Next completion item           |
| Insert         | `<C-p>`      | Prev completion item           |
| Insert         | `<C-y>`      | Confirm completion             |
| Insert         | `<C-Space>`  | Trigger completion menu        |
| Insert         | `<C-b>`      | Scroll docs up                 |
| Insert         | `<C-f>`      | Scroll docs down               |
| Insert/Select  | `<C-l>`      | Expand / jump snippet forward  |
| Insert/Select  | `<C-h>`      | Jump snippet backward          |

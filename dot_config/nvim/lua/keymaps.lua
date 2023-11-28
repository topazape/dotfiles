-- delete all without register
vim.keymap.set("n", "<LEADER>d", "<CMD>%d _<CR>", { noremap = true, silent = true })

-- Normal
---- バッファ切り替え
vim.keymap.set("n", "<M-n>", "<CMD>bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-p>", "<CMD>bprevious<CR>", { noremap = true, silent = true })
---- ハイライトを消す
vim.keymap.set("n", "<ESC><ESC>", "<Cmd>nohlsearch<CR>", { noremap = true, silent = true })
---- x で削除した内容をレジスタに保存しない
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
---- s で削除した内容をレジスタに保存しない
vim.keymap.set("n", "s", '"_s', { noremap = true, silent = true })
---- tmux ライクなウィンドウ操作
vim.keymap.set("n", "<C-w>{", "<C-w><C-x>", { noremap = true, silent = false })
vim.keymap.set("n", "<C-w>}", "<C-w><C-x>", { noremap = true, silent = false })
vim.keymap.set("n", "<C-w>J", "<C-w>+", { noremap = true, silent = false })
vim.keymap.set("n", "<C-w>K", "<C-w>-", { noremap = true, silent = false })

-- Insert
---- Emacs ライクな操作
vim.keymap.set("i", "<C-p>", "<Up>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-n>", "<Down>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-b>", "<Left>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-f>", "<Right>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-a>", "<Home>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-e>", "<End>", { noremap = true, silent = false })
vim.keymap.set("i", "<C-d>", "<Del>", { noremap = true, silent = false })
---- C-d を DELETE に
vim.keymap.set("i", "<C-d>", "<Del>", { noremap = true, silent = true })
---- C-h を BS に
vim.keymap.set("i", "<C-h>", "<BS>", { noremap = true, silent = true })

-- Command
---- Emacs ライクな操作
vim.keymap.set("c", "<C-p>", "<Up>", { noremap = true, silent = false })
vim.keymap.set("c", "<C-n>", "<Down>", { noremap = true, silent = false })
vim.keymap.set("c", "<C-b>", "<Left>", { noremap = true, silent = false })
vim.keymap.set("c", "<C-f>", "<Right>", { noremap = true, silent = false })
vim.keymap.set("c", "<C-a>", "<Home>", { noremap = true, silent = false })
vim.keymap.set("c", "<C-e>", "<End>", { noremap = true, silent = false })
vim.keymap.set("c", "<C-d>", "<Del>", { noremap = true, silent = false })

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

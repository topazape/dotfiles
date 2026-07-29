-- Normal
---- バッファ切り替え
vim.keymap.set("n", "<M-n>", "<CMD>bnext<CR>", { silent = true })
vim.keymap.set("n", "<M-p>", "<CMD>bprevious<CR>", { silent = true })
---- ハイライトを消す
vim.keymap.set("n", "<ESC><ESC>", "<Cmd>nohlsearch<CR>", { silent = true })
---- x で削除した内容をレジスタに保存しない
vim.keymap.set("n", "x", '"_x', { silent = true })
---- s で削除した内容をレジスタに保存しない
vim.keymap.set("n", "s", '"_s', { silent = true })
---- tmux ライクなウィンドウ操作
vim.keymap.set("n", "<C-w>{", "<C-w><C-x>")
vim.keymap.set("n", "<C-w>}", "<C-w><C-x>")
vim.keymap.set("n", "<C-w>H", "<C-w><")
vim.keymap.set("n", "<C-w>J", "<C-w>+")
vim.keymap.set("n", "<C-w>K", "<C-w>-")
vim.keymap.set("n", "<C-w>L", "<C-w>>")

-- Insert
---- Emacs ライクな操作
vim.keymap.set("i", "<C-p>", "<Up>")
vim.keymap.set("i", "<C-n>", "<Down>")
vim.keymap.set("i", "<C-b>", "<Left>")
vim.keymap.set("i", "<C-f>", "<Right>")
vim.keymap.set("i", "<C-a>", "<Home>")
vim.keymap.set("i", "<C-e>", "<End>")
---- C-d を DELETE に
vim.keymap.set("i", "<C-d>", "<Del>")
---- C-h を BS に
vim.keymap.set("i", "<C-h>", "<BS>")

-- Command
---- Emacs ライクな操作
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")
vim.keymap.set("c", "<C-b>", "<Left>")
vim.keymap.set("c", "<C-f>", "<Right>")
vim.keymap.set("c", "<C-a>", "<Home>")
vim.keymap.set("c", "<C-e>", "<End>")
vim.keymap.set("c", "<C-d>", "<Del>")

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { silent = true })

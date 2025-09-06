vim.g.mapleader = ","

--- 光标移动 ---
vim.keymap.set({ "n", "v" }, "u", "k", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "e", "j", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "n", "h", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "i", "l", { noremap = true, silent = true })
---
vim.keymap.set({ "n", "v" }, "<C-u>", "6k", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-e>", "6j", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-n>", "ge", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-Left>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-i>", "w", { noremap = true, silent = true })
vim.keymap.set("n", "<C-o>", "<C-Right>", { noremap = true, silent = true })
---
vim.keymap.set("i", "<C-u>", "<Up>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-e>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", '<C-n>', '<Left>', { noremap = true, silent = true })
vim.keymap.set("i", '<C-i>', '<Right>', { noremap = true, silent = true })
---
vim.keymap.set({ "n", "v", "i" }, "<C-[>", "<ESC>I", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<C-]>", "<ESC>A", { noremap = true, silent = true })

--- 代码移动 ---
vim.keymap.set("v", "E", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) -- v选中部分纵向移动
vim.keymap.set("v", "U", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "N", "<gv", { noremap = true, silent = true })              -- v选中部分横向移动
vim.keymap.set("v", "I", ">gv", { noremap = true, silent = true })

-- 横向翻页
vim.keymap.set({ "n", "v", "i" }, "<PageUp>", "<Home>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<PageDown>", '<ESC>zL', { noremap = true, silent = true })

--- 多标签 ---
vim.keymap.set({ "n", "v", "i" }, "<C-Tab>", "gt", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<A-1>", ":tabn 1<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<A-2>", ":tabn 2<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<A-3>", ":tabn 3<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<A-4>", ":tabn 4<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<A-5>", ":tabn 5<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<A-6>", ":tabn 6<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<A-7>", ":tabn 7<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<A-8>", ":tabn 8<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<A-9>", ":tabn 9<CR>", { noremap = true, silent = true })
---
vim.keymap.set({ "n", "v", "i" }, "<A-n>", ":-tabmove<CR>", { noremap = true, silent = true }) -- Alt+n/i左右切换标签页
vim.keymap.set({ "n", "v", "i" }, "<A-i>", ":+tabmove<CR>", { noremap = true, silent = true })
---
vim.keymap.set({ "n", "v", "i" }, "<A-Up>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<A-Down>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<A-Left>", '<C-w>h', { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<A-Right>", '<C-w>l', { noremap = true, silent = true })

--- 模式切换 ---
vim.keymap.set({ "v", "i" }, '<C-o>', '<Esc>', { noremap = true, silent = true })
---
vim.keymap.set("n", "a", "i", { noremap = true, silent = true })

--- 功能键 ---
vim.keymap.set("n", ":", ":", { noremap = true, silent = false })
vim.keymap.set("n", ";", ":", { noremap = true, silent = false })

vim.keymap.set({ "n", "i" }, "<tab>", "<tab>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "i" }, "<ESC>", "<ESC>", { noremap = true, silent = true })

vim.keymap.set("n", "l", "n", { noremap = true, silent = true })
vim.keymap.set("n", "L", "N", { noremap = true, silent = true })
vim.keymap.set("n", "<C-r>", "u", { noremap = true, silent = true })
vim.keymap.set("n", "rr", "<C-r>", { noremap = true, silent = true })

--- 快捷键 ---
vim.keymap.set({ "n", "i", "v" }, "<F5>", ":source<CR>", { noremap = true, silent = false })
vim.keymap.set({ "n", "v", "i" }, "<F2>", "@1")

--- 折叠 ---
vim.keymap.set("n", "zz", ":normal! zc<CR>")
vim.keymap.set("n", "zo", ":normal! zo<CR>")


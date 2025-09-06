local opt = vim.opt
local buf = vim.b

-- opt.scrolloff = 1000000 -- 光标不动

opt.showmode = false -- 状态栏显示当前模式

opt.relativenumber = true -- 相对行号
opt.number = true -- 绝对行号

opt.tabstop = 4 -- 制表符空格数
opt.shiftwidth = 4 -- 缩进宽度
opt.expandtab = true -- 使用空格代替制表符
opt.autoindent = true -- 自动缩进
opt.smartindent = true -- 智能缩进
opt.shiftround = true -- 缩进操作时，使得行的缩进总是 shiftwidth 的倍数

opt.wrap = false -- 自动折行
opt.hlsearch = false -- 高亮搜索结果
opt.cursorline = true -- 高亮当前行

opt.wildmenu = true -- 命令行补全时，使用菜单
opt.completeopt = { "menu", "menuone" } -- 设置补全菜单的行为，使其无论匹配项数量多少，都会弹出菜单

opt.mouse = "a" -- 在所有模式下启用鼠标
opt.autoread = true -- 文件若在外部修改，会自动读取
opt.title = true -- 显示标题

opt.swapfile = false -- 创建交换文件
opt.backup = false -- 不创建备份文件

opt.clipboard = "unnamedplus"
opt.updatetime = 50 -- 光标停止后多久触发 CursorHold
opt.undofile = true -- 保存撤销历史
opt.undodir = vim.fn.expand("$HOME/.local/share/nvim/undo") -- 撤销文件的保存位置
opt.exrc = true -- 允许使用当前目录下的 .vimrc 文件

opt.splitright = true -- 新窗口在右侧打开
opt.splitbelow = true -- 新窗口在下方打开

opt.ignorecase = true -- 搜索时忽略大小写
opt.smartcase = true -- 存在大写时只显示大写搜索

-- 外观
opt.termguicolors = true --开启终端的真彩色
opt.signcolumn = "yes" --始终显示标记列

-- 明确编码
buf.fileenconding = "utf-8"

-- highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    pattern = { "*" },
    callback = function()
        vim.highlight.on_yank({
            timeout = 300,
        })
    end,
})

vim.o.foldenable = true         -- 启用折叠
vim.o.foldmethod = 'expr'       -- 使用表达式折叠
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'  -- 使用 Treesitter 的折叠表达式
vim.o.foldlevel = 99            -- 默认展开大多数折叠

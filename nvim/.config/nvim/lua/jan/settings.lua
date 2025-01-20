--netrw
vim.g.netrw_banner = 0

--Cursor
vim.opt.guicursor = ""

--Enable line numbering and relative number
vim.opt.nu = true
vim.opt.relativenumber = true

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

--Number of spaces to use for a tab
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

--Show chars for tabs, spaces etc.
--vim.opt.list = true
--vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

--Lines above and below cursor while navigating file
vim.opt.scrolloff = 8

--Set highlight on search
vim.opt.hlsearch = true

--How ofter the swapFile gets updated during inserting
vim.opt.updatetime = 50

--Always show signcolumn
vim.opt.signcolumn = "yes"

--Enable truecolor
vim.opt.termguicolors = true

-- use system clipboard as default register
vim.opt.clipboard:append("unnamedplus")

--Max columncount
vim.opt.colorcolumn = "80"

--Diasble text wrapping
vim.opt.wrap = false

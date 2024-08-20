require("config.remap")
require("config.lazy")

-- vim.lsp.set_log_level("debug")

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set nowrap")
vim.cmd("set mouse=nvi")
vim.cmd("set relativenumber")
vim.cmd("set number relativenumber")
vim.cmd("set cc=80")
vim.cmd("setlocal spell spelllang=en_us")

-- Determine how text with the "conceal" syntax attribute :syn-conceal
-- 	is shown: (needed fo obsidian)
vim.cmd("set conceallevel=2")

vim.cmd.colorscheme("catppuccin")


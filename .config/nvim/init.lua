require("config.remap")
require("config.lazy")

if vim.g.neovide then
    vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
    vim.keymap.set({ "i", "v" }, "<C-S-v>", "<ESC>\"+pa")
    vim.o.guifont = "JetBrainsMono Nerd Font:h10"
    -- vim.g.neovide_cursor_vfx_mode = "pixiedust"
end

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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
    vim.opt_local.smartindent = true
    vim.opt_local.textwidth = 80
  end,
})

vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)
vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<Leader>h", ":nohlsearch<CR>", opts)

-- stupid lsp
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<Leader>f", function()
    vim.lsp.buf.format({ async = true })
end, opts)

-- CopilotChat
vim.keymap.set("n", "<Leader>cct", ":CopilotChatToggle<CR>", opts)
vim.keymap.set("n", "<Leader>ccc", ":CopilotChat ", { silent = false })
vim.keymap.set("n", "<Leader>cce", ":CopilotChatExplain<CR>", opts)
vim.keymap.set("n", "<Leader>ccf", ":CopilotChatFix<CR>", opts)
vim.keymap.set("n", "<Leader>ccfd", ":CopilotChatFixDiagnostic<CR>", opts)

-- Obsidian
vim.keymap.set("n", "<Leader>oo", ":ObsidianOpen<CR>", opts)
vim.keymap.set("n", "<Leader>fo", ":ObsidianSearch<CR>", opts)


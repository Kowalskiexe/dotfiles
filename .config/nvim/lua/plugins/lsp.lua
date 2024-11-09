return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "pyright",
                    "tailwindcss",
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    "neovim/nvim-lspconfig",
    config = function()
        print('LSP config')
        local lspconfig = require("lspconfig")
        -- WARN: gotta pass the capabilities to the setup function

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                --vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                --vim.bo[ev.buf].tagfunc = "v:lua.vim.lsp.tagfunc"
                --vim.bo[ev.buf].formatexpr = "v:lua.vim.lsp.formatexpr"

                -- local opts = { buffer = ev.buf }
                -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                -- 
                -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
                --
                -- vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
                -- vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
                -- vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
                -- vim.keymap.set("n", "<Leader>gr", vim.lsp.buf.references, opts)
                -- vim.keymap.set("n", "<Leader>f", function()
                --     vim.lsp.buf.format({ async = true })
                -- end, opts)
            end,
        })
    end,
}

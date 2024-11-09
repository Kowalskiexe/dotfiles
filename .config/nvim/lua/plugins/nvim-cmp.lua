return {
    -- cmp sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "luckasRanarison/tailwind-tools.nvim",
            "onsails/lspkind-nvim",
        },
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Enter>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    -- { name = 'vsnip' }, -- For vsnip users.
                    { name = "luasnip" }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                    { name = "buffer" },
                    { name = "nvim_lsp_signature_help" },
                    -- { name = "supermaven" },
                }),
                formatting = {
                    format = require("lspkind").cmp_format({
                        before = require("tailwind-tools.cmp").lspkind_format,
                    }),
                },
            })

            -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
            -- Set configuration for specific filetype.
            --[[ cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
              { name = 'git' },
            }, {
              { name = 'buffer' },
            })
         })
         require("cmp_git").setup() ]]
            --

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
                matching = { disallow_symbol_nonprefix_matching = false },
            })

            -- Set up lspconfig.
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- Replace <YOUR_LSP_SERVER> with each lsp server you"ve enabled.
            -- require("lspconfig")["<YOUR_LSP_SERVER>"].setup {
            --     capabilities = capabilities
            -- }
            require("lspconfig")["tsserver"].setup({
                capabilities = capabilities,
            })
            require("lspconfig")["mojo"].setup({
                capabilities = capabilities,
            })
            require("lspconfig")["phpactor"].setup({
                capabilities = capabilities,
            })
            require("lspconfig")["lua_ls"].setup({
                capabilities = capabilities,
            })
            require("lspconfig")["nil_ls"].setup({
                capabilities = capabilities,
            })
            require("lspconfig")["pyright"].setup({
                capabilities = capabilities,
            })
            require("lspconfig")["clangd"].setup({
                capabilities = capabilities,
            })
            require("lspconfig")["bashls"].setup({
                capabilities = capabilities,
            })
            require("lspconfig").ruff.setup({
                capabilities = capabilities,
                init_options = {
                    settings = {
                        configuration = "~/.config/nvim/ruff.toml",
                    },
                },
            })
            -- require("lspconfig")["basedpyright"].setup {
            --     capabilities = capabilities
            -- }
            -- require("lspconfig")["jedi_language_server"].setup {
            --     capabilities = capabilities
            -- }
            -- require("lspconfig")["pylsp"].setup({
            --     capabilities = capabilities,
            -- })
            require("lspconfig")["clangd"].setup({
                capabilities = capabilities,
            })
            require("lspconfig")["tailwindcss"].setup({
                capabilities = capabilities,
            })
        end,
    },
}

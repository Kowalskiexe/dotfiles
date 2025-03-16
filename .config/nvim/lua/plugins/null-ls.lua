return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.formatting.ruff,
                null_ls.builtins.formatting.isort,
                -- null_ls.builtins.formatting.prettier,
                null_ls.builtins.completion.spell,
                null_ls.builtins.completion.luasnip,
                null_ls.builtins.code_actions.refactoring,
                null_ls.builtins.code_actions.proselint,
                null_ls.builtins.code_actions.statix,
                null_ls.builtins.diagnostics.actionlint,
                -- null_ls.builtins.diagnostics.alex,
                null_ls.builtins.diagnostics.checkmake,
                require("none-ls.diagnostics.eslint_d"), -- requires none-ls-extras.nvim
                require("none-ls.code_actions.eslint_d"),
                require("none-ls.formatting.eslint_d"),
                -- require("none-ls.diagnostics.cpplint"),
                require("none-ls.formatting.jq"),
                require("none-ls.formatting.autopep8"),
            },
        })
    end,
}

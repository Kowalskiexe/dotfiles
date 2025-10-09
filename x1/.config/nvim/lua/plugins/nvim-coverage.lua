return {
    "andythigpen/nvim-coverage",
    version = "*",
    config = function()
        require("coverage").setup({
            auto_reload = true,
            highlights = {
                -- must look different then git diff
                covered = { fg = "#00c6ff", },
                uncovered = { fg = "#ff3900", },
            },
        })
        vim.keymap.set("n", "<leader>cl", function()
            vim.cmd("Coverage")
        end, { desc = "Coverage: load coverage" })
        vim.keymap.set("n", "<leader>cc", function()
            vim.cmd("CoverageClear")
        end, { desc = "Coverage: clear coverage" })
        vim.keymap.set("n", "<leader>ct", function()
            vim.cmd("CoverageToggle")
        end, { desc = "Coverage: toggle" })
        vim.keymap.set("n", "<leader>cs", function()
            vim.cmd("CoverageSummary")
        end, { desc = "Coverage: show summary" })
    end,
}

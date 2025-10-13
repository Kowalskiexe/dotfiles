return {
    "numToStr/Comment.nvim",
    opts = {
        padding = true,
    },
    config = function()
        require('Comment').setup()
        -- vim.keymap.set("n", "<C-_>", require('Comment').toggle, {})
    end,
}

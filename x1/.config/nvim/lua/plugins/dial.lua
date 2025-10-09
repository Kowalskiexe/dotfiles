return {
    {
        "monaqa/dial.nvim",
        event = "BufRead",
        config = function()
            local augend = require("dial.augend")
            require("dial.config").augends:register_group{
              default = {
                augend.integer.alias.decimal,   -- nonnegative decimal number (0, 1, 2, 3, ...)
                augend.integer.alias.hex,       -- nonnegative hex number  (0x01, 0x1a1f, etc.)
                augend.date.alias["%Y/%m/%d"],  -- date (2022/02/19, etc.)
                augend.integer.alias.decimal,
                augend.constant.alias.bool,    -- boolean value (true <-> false)
                augend.date.alias["%m/%d/%Y"], -- date (02/19/2022, etc.)
              },
            }

            vim.keymap.set("n", "<Leader>a", require("dial.map").inc_normal("default"))
            vim.keymap.set("n", "<Leader>x", require("dial.map").dec_normal("default"))
        end,
    },

}

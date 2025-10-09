return {
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("tailwind-tools").setup({})
            vim.keymap.set("v", "<Leader>tw", ":TailwindSortSelection<CR>", { noremap = true })
        end
	},
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        -- optionally, override the default options:
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })
        end,
    },
}

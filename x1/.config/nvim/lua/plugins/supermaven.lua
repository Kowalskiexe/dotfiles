return {
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<Tab>",
					clear_suggestion = "<C-]>",
					accept_word = "<C-h>",
				},
				ignore_filetypes = {
                    env = true,
                    gitcommit = true,
                    markdown = true
                },
				color = {
					suggestion_color = "#727272",
					cterm = 244,
				},
				log_level = "off", -- set to "off" to disable logging completely
				disable_inline_completion = false, -- disables inline completion for use with cmp
				disable_keymaps = false, -- disables built in keymaps for more manual control
			})
		end,
	},
}

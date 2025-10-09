return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "AndreM222/copilot-lualine",
    },
    config = function()

        local python_venv = function()
            local venv = vim.env.VIRTUAL_ENV
            if venv then
                return string.format("🐍 %s", venv:match(".*/(.*)"))
            end
            return ""
        end

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                --component_separators = { left = "", right = ""},
                --section_separators = { left = "", right = ""},
                component_separators = { left = "|", right = "|"},
                section_separators = { left = "", right = ""},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {
                    "mode",
                },
                lualine_b = {"branch", "diagnostics", python_venv},
                lualine_c = {"filename"},
                lualine_x = {"copilot", "filetype"},
                lualine_y = {"progress"},
                lualine_z = {"location"}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {"filename"},
                lualine_x = {"location"},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        })
    end
}

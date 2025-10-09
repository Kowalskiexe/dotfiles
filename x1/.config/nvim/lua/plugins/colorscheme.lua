return {

    -- tokyonight
    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = { style = "moon" },
    },

    -- oxocarbon
    "nyoom-engineering/oxocarbon.nvim",

    -- zethyr
    "glepnir/zephyr-nvim",

    -- anysphere from cursor
    "dapovich/anysphere.nvim",

    -- catppuccin
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        opts = {
            integrations = {
                aerial = true,
                alpha = true,
                cmp = true,
                dashboard = true,
                flash = true,
                gitsigns = true,
                headlines = true,
                illuminate = true,
                indent_blankline = { enabled = true },
                leap = true,
                lsp_trouble = true,
                mason = true,
                markdown = true,
                mini = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                navic = { enabled = true, custom_bg = "lualine" },
                neotest = true,
                neotree = true,
                noice = true,
                notify = true,
                semantic_tokens = true,
                telescope = true,
                treesitter = true,
                treesitter_context = true,
                which_key = true,
            },
        },
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
        opts = {
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "hard", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = false,
        }
    },
    {
        "EdenEast/nightfox.nvim",
        config = function()
            -- Default options
            require('nightfox').setup({
              options = {
                -- Compiled file's destination location
                compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                compile_file_suffix = "_compiled", -- Compiled file suffix
                transparent = false,     -- Disable setting background
                terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                dim_inactive = false,    -- Non focused panes set to alternative background
                module_default = true,   -- Default enable value for modules
                colorblind = {
                  enable = false,        -- Enable colorblind support
                  simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
                  severity = {
                    protan = 0,          -- Severity [0,1] for protan (red)
                    deutan = 0,          -- Severity [0,1] for deutan (green)
                    tritan = 0,          -- Severity [0,1] for tritan (blue)
                  },
                },
                styles = {               -- Style to be applied to different syntax groups
                  comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
                  conditionals = "NONE",
                  constants = "NONE",
                  functions = "NONE",
                  keywords = "NONE",
                  numbers = "NONE",
                  operators = "NONE",
                  strings = "NONE",
                  types = "NONE",
                  variables = "NONE",
                },
                inverse = {             -- Inverse highlight for different types
                  match_paren = false,
                  visual = false,
                  search = false,
                },
                modules = {             -- List of various plugins and additional options
                  -- ...
                },
              },
              palettes = {},
              specs = {},
              groups = {},
            })
        end
    },
}

return {
    {
        "bennypowers/nvim-regexplainer",
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require'regexplainer'.setup {
                -- 'narrative'
                mode = 'narrative', -- TODO: 'ascii', 'graphical'

                -- automatically show the explainer when the cursor enters a regexp
                auto = true,

                -- filetypes (i.e. extensions) in which to run the autocommand
                filetypes = {
                    'html',
                    'js',
                    'cjs',
                    'mjs',
                    'ts',
                    'jsx',
                    'tsx',
                    'cjsx',
                    'mjsx',
                    'py',
                },

                -- Whether to log debug messages
                debug = false,

                -- 'split', 'popup'
                display = 'popup',

                mappings = {
                    toggle = 'gR',
                    -- examples, not defaults:
                    -- show = 'gS',
                    -- hide = 'gH',
                    -- show_split = 'gP',
                    -- show_popup = 'gU',
                },

                narrative = {
                    indendation_string = '> ', -- default '  '
                },
            }
        end,
    },
}

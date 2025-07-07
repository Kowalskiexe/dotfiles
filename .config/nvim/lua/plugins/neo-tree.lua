return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        local events = require("neo-tree.events")
        local function on_move(data)
            Snacks.rename.on_rename_file(data.source, data.destination)
            local api = require("pymple.api")
            local config = require("pymple.config")
            api.update_imports(data.source, data.destination, config.user_config.update_imports)
        end
        require("neo-tree").setup({
            close_if_last_window = true,
            window = {
                width = 25,
            },
            filesystem = {
                use_libuv_file_watcher = true,
                follow_current_file = { enabled = true },
            },
            event_handlers = {
                {
                    event = events.FILE_MOVED,
                    handler = on_move,
                },
                {
                    event = events.FILE_RENAMED,
                    handler = on_move,
                },
            },
        })
        vim.keymap.set("n", "<Leader>e", ":Neotree toggle<CR>")
    end,
}

return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "ChristianChiarulli/neovim-codicons",
            "nvim-neotest/nvim-nio",
            "nvim-telescope/telescope-dap.nvim",
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            require("nvim-dap-virtual-text").setup({})

            --vim.highlight.create('DapBreakpoint', { ctermbg=0, guifg='#993939', guibg='#31353f' }, false)
            --vim.highlight.create('DapLogPoint', { ctermbg=0, guifg='#61afef', guibg='#31353f' }, false)
            --vim.highlight.create('DapStopped', { ctermbg=0, guifg='#98c379', guibg='#31353f' }, false)

            vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
            vim.fn.sign_define('DapBreakpointCondition', { text='⭕', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
            vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
            vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
            vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

            dap.listeners.before.attach.dapui_config = function()
              dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
              dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
              dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
              dapui.close()
            end

            vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
            vim.keymap.set("n", "<Leader>dc", dap.continue, {})
            vim.keymap.set("n", "<C-n>", dap.step_over, {})
            vim.keymap.set("n", "<C-m>", dap.step_into, {})
            vim.keymap.set("n", "<C-b>", dap.step_out, {})

            vim.keymap.set("n", "<Leader>dd", dapui.toggle, {})

            -- set up adapters
            dap.adapters.python = function(cb, config)
              if config.request == 'attach' then
                ---@diagnostic disable-next-line: undefined-field
                local port = (config.connect or config).port
                ---@diagnostic disable-next-line: undefined-field
                local host = (config.connect or config).host or '127.0.0.1'
                cb({
                  type = 'server',
                  port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                  host = host,
                  options = {
                    source_filetype = 'python',
                  },
                })
              else
                cb({
                  type = 'executable',
                  command = "/home/inter/.local/share/nvim/mason/bin/debugpy-adapter",
                  --args = { '-m', 'debugpy.adapter' },
                  options = {
                    source_filetype = 'python',
                  },
                })
              end
            end
            dap.configurations.python = {
                {
                    -- The first three options are required by nvim-dap
                    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
                    request = 'launch';
                    name = "Launch file";

                    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

                    program = "${file}"; -- This configuration will launch the current file if used.
                    pythonPath = function()
                        -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                        -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                        -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                        local virtual = os.getenv("VIRTUAL_ENV") or "xd"
                        if vim.fn.executable(virtual .. "/bin/python") == 1 then
                            return virtual .. "/bin/python"
                        else
                            return '/usr/bin/python'
                        end
                    end;
                },
                {
                    type = 'python',
                    request = 'attach',
                    name = 'Attach to running debugpy server',
                    host = '0.0.0.0',  -- The host where debugpy is running
                    port = 5678,         -- The port debugpy is listening on (default is 5678)
                    justMyCode = false,  -- Set to true if you only want to debug your code
                },
            }
        end
    },
}

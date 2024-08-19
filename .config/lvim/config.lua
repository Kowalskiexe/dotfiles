-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.relativenumber = true -- relative line numbers

lvim.plugins = {
	--    {
	--        "iamcco/markdown-preview.nvim",
	--        build = "cd app && npm install",
	--        ft = "markdown",
	--        config = function()
	--            vim.g.mkdp_auto_start = 1
	--        end,
	--    },
  {'akinsho/git-conflict.nvim', version = "*", config = true},
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },
	{
		"ethanholz/nvim-lastplace",
		event = "BufRead",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = {
					"gitcommit",
					"gitrebase",
					"svn",
					"hgcommit",
				},
				lastplace_open_folds = true,
			})
		end,
	},
	--    {
	--        "turbio/bracey.vim",
	--        cmd = {"Bracey", "BracyStop", "BraceyReload", "BraceyEval"},
	--        build = "npm install --prefix server",
	--    },
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
  },
  "catppuccin/nvim",
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- "mfussenegger/nvim-dap-python",
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --     "nvim-neotest/nvim-nio"
  --   },
  --   config = function()
  --     local dap, dapui = require("dap"), require("dapui")

  --     vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { noremap = true, silent = true })
  --     vim.keymap.set("n", "<Leader>dc", dap.continue, { noremap = true, silent = true })

  --     dap.listeners.before.attach.dapui_config = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.launch.dapui_config = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated.dapui_config = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited.dapui_config = function()
  --       dapui.close()
  --     end
  --   end
  -- },
  "nvim-neotest/neotest",
	"nvim-neotest/neotest-python",
	"lervag/vimtex",
  "zbirenbaum/copilot.lua",
	-- "github/copilot.vim",
  {
    "karb94/neoscroll.nvim",
    config = function ()
      require('neoscroll').setup({})
    end
  },
  "lewis6991/satellite.nvim",
  {
    "chrisgrieser/nvim-puppeteer",
    lazy = false, -- plugin lazy-loads itself. Can also load on filetypes.
  },
  "alec-gibson/nvim-tetris", -- game
  "seandewar/killersheep.nvim", -- game
  "alanfortlink/blackjack.nvim", -- game
  "Eandrju/cellular-automaton.nvim", -- eye candy
  -- {
  --   "m4xshen/hardtime.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --   opts = {}
  -- },
  {
    "nat-418/boole.nvim",
    config = function()
      require('boole').setup({
        mappings = {
          increment = '<C-a>',
          decrement = '<C-x>'
        },
        -- User defined loops
        additions = {
          {'Foo', 'Bar'},
          {'tic', 'tac', 'toe'}
        },
        allow_caps_additions = {
          {'enable', 'disable'}
          -- enable → disable
          -- Enable → Disable
          -- ENABLE → DISABLE
        }
      });
    end
  },
  {
    "tris203/precognition.nvim",
    --event = "VeryLazy",
    opts = {
      startVisible = false,
    -- showBlankVirtLine = true,
    -- highlightColor = { link = "Comment" },
    -- hints = {
    --      Caret = { text = "^", prio = 2 },
    --      Dollar = { text = "$", prio = 1 },
    --      MatchingPair = { text = "%", prio = 5 },
    --      Zero = { text = "0", prio = 1 },
    --      w = { text = "w", prio = 10 },
    --      b = { text = "b", prio = 9 },
    --      e = { text = "e", prio = 8 },
    --      W = { text = "W", prio = 7 },
    --      B = { text = "B", prio = 6 },
    --      E = { text = "E", prio = 5 },
    -- },
    -- gutterHints = {
    --     G = { text = "G", prio = 10 },
    --     gg = { text = "gg", prio = 9 },
    --     PrevParagraph = { text = "{", prio = 8 },
    --     NextParagraph = { text = "}", prio = 8 },
    -- },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          ["html"] = {
            enable_close = false
          }
        }
      });
    end,
    lazy = true,
    event = "VeryLazy",
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "personal",
            path = "~/vaults/personal",
          },
          {
            name = "work",
            path = "~/vaults/work",
          },
        },

        -- see below for full list of options 👇
      })
    end,
  },
  "christoomey/vim-tmux-navigator",
}


vim.g.vimtex_view_method = "zathura"
lvim.colorscheme = "tokyonight-moon"

-- Disable automatic LSP installation so it doesn't interfere with the LSPs
-- from containers
lvim.lsp.automatic_servers_installation = false

-- imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
-- let g:copilot_no_tab_map = v:true

-- Unmap <Tab> from auto completion
-- You can still use <C-j> and <C-k> to navigate through completion items
-- <Tab> is for copilot
-- local cmp = require("cmp");
lvim.builtin.cmp.mapping["<Tab>"] = nil

-- vim.lsp.start({
--     name = "clangd",
--     cmd = { "clangd", "--background-index" },
--     filetypes = { "c", "cpp", "cxx", "cc", "objc", "objcpp" },
--     root_dir = require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt", ".git", "CMakeLists.txt", "Makefile", "build"),
--     init_options = {
--         clangdFileStatus = true,
--         usePlaceholders = true,
--         completeUnimported = true,
--         semanticHighlighting = true,
--     },
-- })


require('copilot').setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    }, layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 0,
    keymap = {
      accept = "<Tab>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 18.x
  server_opts_overrides = {},
})

-- Required for copilot_chat to work
local copilot_chat = require("CopilotChat")
copilot_chat:setup({})


-- require('hardtime').setup {
--   enable = false,
-- }

-- scrollbar config
require('satellite').setup {
  current_only = false,
  winblend = 50,
  zindex = 40,
  excluded_filetypes = {},
  width = 2,
  handlers = {
    cursor = {
      enable = true,
      -- Supports any number of symbols
      symbols = { '⎺', '⎻', '⎼', '⎽' }
      -- symbols = { '⎻', '⎼' }
      -- Highlights:
      -- - SatelliteCursor (default links to NonText
    },
    search = {
      enable = true,
      -- Highlights:
      -- - SatelliteSearch (default links to Search)
      -- - SatelliteSearchCurrent (default links to SearchCurrent)
    },
    diagnostic = {
      enable = true,
      signs = {'-', '=', '≡'},
      min_severity = vim.diagnostic.severity.HINT,
      -- Highlights:
      -- - SatelliteDiagnosticError (default links to DiagnosticError)
      -- - SatelliteDiagnosticWarn (default links to DiagnosticWarn)
      -- - SatelliteDiagnosticInfo (default links to DiagnosticInfo)
      -- - SatelliteDiagnosticHint (default links to DiagnosticHint)
    },
    gitsigns = {
      enable = true,
      signs = { -- can only be a single character (multibyte is okay)
        add = "│",
        change = "│",
        delete = "-",
      },
      -- Highlights:
      -- SatelliteGitSignsAdd (default links to GitSignsAdd)
      -- SatelliteGitSignsChange (default links to GitSignsChange)
      -- SatelliteGitSignsDelete (default links to GitSignsDelete)
    },
    marks = {
      enable = true,
      show_builtins = false, -- shows the builtin marks like [ ] < >
      key = 'm'
      -- Highlights:
      -- SatelliteMark (default links to Normal)
    },
    quickfix = {
      signs = { '-', '=', '≡' },
      -- Highlights:
      -- SatelliteQuickfix (default links to WarningMsg)
    }
  },
}

-- is it necessary?
lvim.builtin.treesitter.autotag.enable = true;

-- code formatting
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  {
    name = "shellcheck",
    args = { "--severity", "warning" },
  },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    name = "proselint",
  },
}

-- Navigate vim panes better
vim.keyamp.set("n", "<c-k>", ":wincmd k<cr>")
vim.keyamp.set("n", "<c-j>", ":wincmd j<cr>")
vim.keyamp.set("n", "<c-h>", ":wincmd h<cr>")
vim.keyamp.set("n", "<c-l>", ":wincmd l<cr>")

-- Debugging
lvim.builtin.dap.active = true
-- local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
-- pcall(function()
--   require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
-- end)
local dap = require('dap')
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
      command = 'path/to/virtualenvs/debugpy/bin/python',
      args = { '-m', 'debugpy.adapter' },
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
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}


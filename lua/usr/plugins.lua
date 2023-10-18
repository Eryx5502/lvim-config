lvim.plugins = {
  -- Themes
  { "folke/tokyonight.nvim" },
  -- { "oxfist/night-owl.nvim" },
  -- General
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppress_dirs = { '~/' },
        auto_save_enabled = true,
        auto_restore_enabled = true,
      }
    end
  },
  {
    'rmagatti/session-lens',
    dependencies = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
    config = function()
      require('session-lens').setup({})
    end
  },
  -- {
  --   "folke/persistence.nvim",
  --   event = "bufreadpre", -- this will only start session saving when an actual file was opened
  --   module = "persistence",
  --   config = function()
  --     require("persistence").setup {
  --       dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
  --       options = { "buffers", "curdir", "tabpages", "winsize" },
  --     }
  --   end,
  -- },
  --
  -- Treesitter text objects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    config = function()
      require("usr.plugin-settings.treesitter").textobjects_setup()
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            config = {
              icon_preset = "diamond",
              icons = {
                delimiter = {
                  horizontal_line = {
                    highlight = "@neorg.delimiters.horizontal_line",
                  },
                },
                code_block = {
                  -- If true will only dim the content of the code block (without the
                  -- `@code` and `@end` lines), not the entirety of the code block itself.
                  content_only = true,

                  -- The width to use for code block backgrounds.
                  --
                  -- When set to `fullwidth` (the default), will create a background
                  -- that spans the width of the buffer.
                  --
                  -- When set to `content`, will only span as far as the longest line
                  -- within the code block.
                  width = "fullwidth",

                  -- Additional padding to apply to either the left or the right. Making
                  -- these values negative is considered undefined behaviour (it is
                  -- likely to work, but it's not officially supported).
                  padding = {
                    -- left = 20,
                    -- right = 20,
                  },

                  -- If `true` will conceal (hide) the `@code` and `@end` portion of the code
                  -- block.
                  conceal = true,

                  nodes = { "ranged_verbatim_tag" },
                  highlight = "CursorLine",
                  -- render = module.public.icon_renderers.render_code_block,
                  insert_enabled = true,
                },
              },
            },
          }, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
                anima = "~/notes/animabf"
              },
              default_workspace = "notes"
            },
          },
          ["core.summary"] = {},
          ["core.journal"] = {
            config = {
              journal_folder = "reuniones",
              strategy = "flat"

            }
          },
        },
      }
    end,
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function(_)
      require('neogen').setup({ snippet_engine = "luasnip" })
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  { 'ggandor/lightspeed.nvim' },
  { 'christoomey/vim-tmux-navigator' },
  -- Sticky buffers
  {
    'stevearc/stickybuf.nvim',
    opts = {},
  },
  -- Signature help
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {
          border = "rounded"
        },
        floating_window_above_cur_line = true
      })
    end,
  },
  -- {'edkolev/tmuxline.vim'},
  { 'zhou13/vim-easyescape' },
  { 'tpope/vim-surround' },
  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = {
      "G", "Git", "Gdiffsplit", "Gvdiffsplit", "Gedit", "Gsplit",
      "Gread", "Gwrite", "Ggrep", "Glgrep", "Gmove",
      "GDelete", "GRemove", "GBrowse",
    },
  },
  -- PR and Issue edit from nvim
  {
    "pwntester/octo.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require("octo").setup()
    end,
  },
  -- see diffview on a nice interface
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  { 'tpope/vim-rhubarb' },             -- For enabling GBrowse for github
  { 'shumphrey/fugitive-gitlab.vim' }, -- For enabling GBrowse for gitlab
  -- {
  --   'akinsho/bufferline.nvim',
  --   dependencies = 'kyazdani42/nvim-web-devicons',
  --   config = require("bufferline").setup(),
  -- },
  -- 'scrooloose/nerdcommenter',
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      highlight = {
        after = "",
      },
    }
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          if vim.fn.has "nvim-0.9" == 1 then
            local builtin = require "statuscol.builtin"
            require("statuscol").setup {
              relculright = true,
              segments = {
                { text = { "%s" }, click = "v:lua.ScSa" },
                { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
                { text = { " ", builtin.foldfunc, " " }, click = "v:lua.ScFa" },
              },
            }
          end
        end
      }
    },
    event = "VeryLazy",
    opts = {
      -- INFO: Uncomment to use treeitter as fold provider, otherwise nvim lsp is used
      -- provider_selector = function(bufnr, filetype, buftype)
      --   return { "treesitter", "indent" }
      -- end,
      open_fold_hl_timeout = 400,
      close_fold_kinds = { "imports", "comment" },
      preview = {
        win_config = {
          border = { "", "─", "", "", "", "─", "", "" },
          -- winhighlight = "Normal:Folded",
          winblend = 0,
        },
        mappings = {
          scrollU = "<C-k>",
          scrollD = "<C-j>",
          jumpTop = "[",
          jumpBot = "]",
        },
      },
    },
    init = function ()
      require("usr.plugin-settings.nvim-ufo").init()
    end,
    config = function (_, opts)
      require("usr.plugin-settings.nvim-ufo").setup(opts)
    end,
  },
  -- {
  --   "luukvbaal/statuscol.nvim", config = function()
  --     local builtin = require("statuscol.builtin")
  --     require("statuscol").setup({
  --       -- configuration goes here, for example:
  --       relculright = true,
  --       segments = {
  --         { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  --         {
  --           sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
  --           click = "v:lua.ScSa"
  --         },
  --         { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
  --         {
  --           sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
  --           click = "v:lua.ScSa"
  --         },
  --       }
  --     })
  --   end,
  -- },
  { 'dhruvasagar/vim-zoom' },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    init = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard", "latex", "tex" }
      vim.g.indent_blankline_buftype_exclude = { "terminal" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end
  },
  -- LaTeX
  {
    'lervag/vimtex',
    lazy = false,
    dependencies = 'KeitaNakamura/tex-conceal.vim',
    config = function()
      require('usr.plugin-settings.vimtex')
    end
  },
  {
    'simrat39/symbols-outline.nvim',
    cmd = "SymbolsOutilne"
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  -- Handlebars (For FoundryVtt)
  { 'mustache/vim-mustache-handlebars' },
  -- HTML
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- Python
  {
    'mfussenegger/nvim-dap-python',
    config = function()
      require('dap-python').setup('~/.pyenv/versions/debugpy/bin/python')
      require('dap').configurations.python[1].env = { PYTHONPATH = vim.fn.getcwd() }
      -- table.insert(require('dap').configurations.python, {
      --   type = 'python',
      --   request = 'launch',
      --   name = 'Python: file inside a project',
      --   program = '${file}',
      --   cwd = vim.fn.getcwd(),
      --   env = { PYTHONPATH = vim.fn.getcwd() },
      --   pythonPath = function()
      --     return 'python'
      --   end,
      --   -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
      -- })
    end
  },
  --[[
  'numirias/semshi', {'do': ':UpdateRemotePlugins'},
  'jeetsukumaran/vim-pythonsense', {'for': 'python'},
  'Vimjas/vim-python-pep8-indent', {'for': 'python'},
  -- Markdown
  'plasticboy/vim-markdown', {'for': 'markdown'},
  -- Powershell ps1
  'PProvost/vim-ps1', {'for': 'ps1'},
  -- HTML
  'alvan/vim-closetag'
  ]]
}

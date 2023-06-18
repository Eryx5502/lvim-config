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
  {
    'kkoomen/vim-doge',
    build = ':call doge#install()',
    config = function()
      vim.g.doge_doc_standard_python = 'numpy'
      vim.g.doge_mapping = '<Leader>D'
    end,
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
  -- {{{ fugitive.vim - premier git plugin for vim
  {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = {
      "G", "Git", "Gdiffsplit", "Gvdiffsplit", "Gedit", "Gsplit",
      "Gread", "Gwrite", "Ggrep", "Glgrep", "Gmove",
      "Gdelete", "Gremove", "Gbrowse",
    },
  },
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

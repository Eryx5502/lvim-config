lvim.plugins = {
  -- General
  {"folke/tokyonight.nvim"},
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppress_dirs = {'~/'},
        auto_save_enabled = true,
        auto_restore_enabled = true,
      }
    end
  },
  {
    'rmagatti/session-lens',
    requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
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
  -- Symbol navigation
  {
    'stevearc/aerial.nvim',
    config = function ()
      require('usr.plugin-settings.aerial')
    end
  },
  {
    'kkoomen/vim-doge',
    run = ':call doge#install()',
    config = function()
      vim.g.doge_doc_standard_python = 'numpy'
    end,
  },
  {'ggandor/lightspeed.nvim'},
  {'christoomey/vim-tmux-navigator'},
  -- {'edkolev/tmuxline.vim'},
  -- {'zhou13/vim-easyescape'},
  {'tpope/vim-surround'},
  -- {{{ fugitive.vim - premier git plugin for vim
  {
    "tpope/vim-fugitive",
    opt = true,
    cmd = {
      "G", "Git", "Gdiffsplit", "Gvdiffsplit", "Gedit", "Gsplit",
      "Gread", "Gwrite", "Ggrep", "Glgrep", "Gmove",
      "Gdelete", "Gremove", "Gbrowse",
    },
  },
  -- {
  --   'akinsho/bufferline.nvim',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = require("bufferline").setup(),
  -- },
  -- 'scrooloose/nerdcommenter',
  {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = require("todo-comments").setup{}
  },
  -- LaTeX
  {
    'lervag/vimtex',
    opt = false,
    requires = 'KeitaNakamura/tex-conceal.vim',
    config = function ()
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
  {'mustache/vim-mustache-handlebars'}
  --[[ -- Python
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

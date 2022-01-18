lvim.plugins = {
    -- General
    {"folke/tokyonight.nvim"},
    {'ggandor/lightspeed.nvim'},
    {'christoomey/vim-tmux-navigator'},
    -- {'edkolev/tmuxline.vim'},
    -- {'zhou13/vim-easyescape'},
    {'tpope/vim-surround'},
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

--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.colorscheme = "tokyonight"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.telescope.defaults.layout_config.width = 0.95
lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = '<C-T>'
lvim.builtin.terminal.float_opts.width = function(term)
  return math.min(math.floor(vim.o.columns * 0.9), 150)
end
lvim.use_icons = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
-- lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.project.patterns = { ".git" }
lvim.builtin.project.detection_methods = { "pattern" }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "latex",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
  "svelte",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = true
lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.diagnostics.float.focusable = true
lvim.lsp.float.focusable = true

lvim.lsp.installer.setup.automatic_servers_installation = true

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
lvim.format_on_save = {
  ---@usage pattern string pattern used for the autocommand (Default: '*')
  pattern = "*.py,*.ts,*.lua",
  ---@usage timeout number timeout in ms for the format request (Default: 1000)
  timeout = 2000,
}
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  --   { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact, json" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  { command = "eslint_d" },
  --   {
  --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "shellcheck",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--severity", "warning" },
  --   },
  --   {
  --     command = "codespell",
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "javascript", "python" },
  --   },
}


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }


-- Include files
require("usr.editor")
require("usr.mappings")
require("usr.plugins")
-- -- Plugin's config
require("usr.luasnip")
require("usr.nvim-cmp")
require('usr.plugin-settings.dap')

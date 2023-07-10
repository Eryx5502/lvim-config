local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

-- General -------------------------------------------------------------------
-- Default leader is <space>
g.mapleader = ' '
g.maplocalleader = 'ñ'

opt.cursorlineopt = 'screenline'
opt.scrolloff = 0
opt.encoding = 'utf-8'
opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

--[[
  tabstop:          Width of tab character
  softtabstop:      Fine tunes the amount of white space to be added
  shiftwidth        Determines the amount of whitespace to add in normal mode
  expandtab:        When on uses space instead of tabs
]]
opt.tabstop        = 2
opt.softtabstop    = 2
opt.shiftwidth     = 2
opt.expandtab      = true
-- Word wrapping
opt.textwidth      = 0
opt.wrap           = true
opt.linebreak      = true
opt.list           = false
-- Smart word weapping
--g.showbreak   =↳
opt.breakindent    = true
opt.breakindentopt = 'sbr'
-- line numbers
opt.number         = true
-- search options
opt.incsearch      = true
opt.hlsearch       = true
-- Font for gui (neovide)
opt.guifont        = 'MesloLGS_NF:h10'
-- Command line height
vim.o.cmdheight    = 1

-- When editing a file, always jump to the last known cursor position.
cmd([[
au BufReadPost * silent! if line("'\"") > 0 && line("'\"") <= line("$") | silent! exe "normal g`\"zz" | endif
]])

-- opt.clipboard = ''
-- Clipboard WSL2
local in_wsl = os.getenv('WSL_DISTRO_NAME') ~= nil
-- Suggested on :h clipboard
if in_wsl then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'win32yank.exe -i',
      ['*'] = 'win32yank.exe -i',
    },
    paste = {
      ['+'] = 'win32yank.exe -o --lf',
      ['*'] = 'win32yank.exe -o --lf'
    },
    cache_enabled = true,
  }
end

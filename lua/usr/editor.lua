
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

-- General -------------------------------------------------------------------
-- Default leader is <space>
g.mapleader = ' '
g.maplocalleader = ','

opt.cursorlineopt = 'screenline'
opt.encoding = 'utf-8'

--[[
  tabstop:          Width of tab character
  softtabstop:      Fine tunes the amount of white space to be added
  shiftwidth        Determines the amount of whitespace to add in normal mode
  expandtab:        When on uses space instead of tabs
]]
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth  = 2
opt.expandtab = true
-- Word wrapping
opt.textwidth = 80
opt.wrap = true
opt.linebreak = true
opt.list = false
-- Smart word weapping
--g.showbreak   =↳
opt.breakindent = true
opt.breakindentopt = 'sbr'
-- line numbers
opt.number = true
-- search options
opt.incsearch = true
opt.hlsearch = true

-- When editing a file, always jump to the last known cursor position.
cmd([[
au BufReadPost * silent! if line("'\"") > 0 && line("'\"") <= line("$") | silent! exe "normal g'\"zz" | endif
]])

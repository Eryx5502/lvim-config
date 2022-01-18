local g = vim.g
--[[ g.vimtex_toc_config = {
  'layer_status': {
    'content': 1,
    'label': 1,
    'todo': 0,
    'include': 1
  }
} ]]
g.tex_flavor='latex'
-- vimtex viewer
g.vimtex_view_method = 'zathura'
--g.vimtex_view_general_viewer = 'SumatraPDF.exe'
--g.vimtex_view_general_options
--    \ = '-reuse-instance -forward-search @tex @line @pdf'
--      \ = '-reuse-instance -forward-search $(wslpath -w @tex) @line $(wslpath -w @pdf)'
--g.vimtex_view_general_options_latexmk = '-reuse-instance'

g.vimtex_quickfix_mode=0
g.vimtex_imaps_leader="´"
-- Add custom mapping through vimtex#imap#add_map
g.vimtex_imaps_disabled = {'jj', 'jJ', 'jk', 'jK', 'jh', 'jH', 'jl', 'jL', 'e', 'q'}

vim.cmd([[
  call vimtex#imaps#add_map({
    \ 'lhs' : 'j',
    \ 'rhs' : '\varphi',
    \})
  call vimtex#imaps#add_map({
    \ 'lhs' : 'o',
    \ 'rhs' : '\omega',
    \})
  call vimtex#imaps#add_map({
    \ 'lhs' : 'O',
    \ 'rhs' : '\Omega',
    \})
  call vimtex#imaps#add_map({
    \ 'lhs' : 'e',
    \ 'rhs' : '\varepsilon',
    \})
  call vimtex#imaps#add_map({
    \ 'lhs' : 'v',
    \ 'rhs' : '\theta',
    \})
  call vimtex#imaps#add_map({
    \ 'lhs' : 'V',
    \ 'rhs' : '\Theta',
    \})
  call vimtex#imaps#add_map({
    \ 'lhs' : 'q',
    \ 'rhs' : '\vartheta',
    \})
  call vimtex#imaps#add_map({
    \ 'lhs' : '+',
    \ 'rhs' : '\dagger',
    \})
]])

-- vimtex-folding
--[[ -- g.vimtex_fold_manual=1
g.vimtex_fold_enabled=1
g.vimtex_fold_types = {
     \ 'envs' : {
     \    'enable': 0,
     \   'blacklist' : ['equation*', 'table'],
     \    'whitelist' : ['proof'],
     \ },
     \ 'env_options': {'enable' : 1}
     \}
]]

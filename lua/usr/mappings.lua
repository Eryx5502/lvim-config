-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- or use vim.api
local map = vim.api.nvim_set_keymap

-- Mapping options:
-- map('n', ...)
-- map('v', ...)
-- map('i', ...)
-- map('t', ...)

-- General mappings ---------------------------------------------
lvim.builtin.which_key.mappings["<leader>"] = { "<cmd>Telescope resume<CR>", "Resume Telescope" }
-- breaks the line in the current possition
lvim.keys.normal_mode["zn"] = 'a<cr><esc>k$'
lvim.keys.normal_mode["] "] = [[mno<esc>`n]]
lvim.keys.normal_mode["[ "] = [[mnO<esc>`n]]
--Clear search highlight
-- map('n', '<leader>,', ':nohlsearch<CR>', {noremap = true, silent = true})
--Use Y in normal mode to copy until end of line
map('n', 'Y', 'y$', { noremap = true })

-- Comments (temp solution for gcc)
lvim.builtin.comment.toggler.line = 'gccc'
map('n', [[gcc]], [[Vgc<esc>]], { noremap = false })

-- Moving lines
map('n', [[<M-C-J>]], [[:m .+1<CR>==]], { noremap = true })
map('n', [[<M-C-K>]], [[:m .-2<CR>==]], { noremap = true })
map('i', [[<M-C-J>]], [[<Esc>:m .+1<CR>==gi]], { noremap = true })
map('i', [[<M-C-K>]], [[<Esc>:m .-2<CR>==gi]], { noremap = true })
map('v', [[<M-C-J>]], [[:m '>+1<CR>gv=gv]], { noremap = true })
map('v', [[<M-C-K>]], [[:m '<-2<CR>gv=gv]], { noremap = true })
-- Moving screen without moving the cursor
map('i', [[<C-Up>]], [[<C-O><C-E>]], { noremap = true })
map('i', [[<C-Down>]], [[<C-O><C-Y>]], { noremap = true })
map('n', [[<C-Up>]], [[<C-E>]], { noremap = true })
map('n', [[<C-Down>]], [[<C-Y>]], { noremap = true })
-- Changing buffers
map('n', [[<M-C-L>]], [[:bnext!<CR>]], { noremap = true })
map('n', [[<M-C-H>]], [[:bprev!<CR>]], { noremap = true })
-- tab completion (not working)
-- map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Plugin mappings ----------------------------------------------
-- TODO-Comments
-- map('n', '<leader>T', ':TodoTelescope<CR>')

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Quit all windows
lvim.builtin.which_key.mappings["Q"] = { ":qa<CR>", "Exit nvim" }
-- Sessions with auto-sessions and session-lens
lvim.builtin.which_key.mappings["S"] = { "<cmd>SearchSession<CR>", "Sessions" }
-- Sessions with persistence
-- lvim.builtin.which_key.mappings["S"]= {
--   name = "Session",
--   c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
--   l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
--   Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
-- }
-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble workspace_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Diagnostics" },
  t = { "<cmd>Trouble todo<cr>", "TODO" },
}

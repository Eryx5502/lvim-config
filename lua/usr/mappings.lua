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
map('n', [[<CR>j]], [[mno<esc>`n]], { noremap = true })
map('n', [[<CR>k]], [[mnO<esc>`n]], { noremap = true })
--Clear search highlight
-- map('n', '<leader>,', ':nohlsearch<CR>', {noremap = true, silent = true})
--Use Y in normal mode to copy until end of line
map('n', 'Y', 'y$', { noremap = true })

-- lsp mappings
lvim.lsp.buffer_mappings.normal_mode['gR'] = lvim.lsp.buffer_mappings.normal_mode['gr']
lvim.lsp.buffer_mappings.normal_mode["gr"] = { function()
  require('telescope.builtin').lsp_references({ initial_mode = 'insert' })
end, "Search references" }

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

-- Plugin mappings ----------------------------------------------
-- TODO-Comments
-- map('n', '<leader>T', ':TodoTelescope<CR>')


-- Buffer search with <leader>bb and buffer prev with <leader>bp
lvim.builtin.which_key.mappings.b.b = { "<cmd>Telescope buffers initial_mode=insert<CR>", "Find" }
lvim.builtin.which_key.mappings.b.p = { "<cmd>BufferLineCyclePrev<CR>", "Previous" }
lvim.builtin.which_key.mappings.b.f = { "<cmd>BufferLineTogglePin<CR>", "Toggle pin" }
lvim.builtin.which_key.mappings["D"] = { ":Neogen<CR>", "Generate docs" }
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
lvim.builtin.which_key.setup.plugins.presets.z = true
lvim.builtin.which_key.setup.plugins.presets.g = true

lvim.builtin.which_key.mappings["r"] = { "<cmd>Telescope oldfiles<CR>", "Recent files" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  [" "] = { "<cmd>TroubleToggle<cr>", "Trouble toggle" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  t = { "<cmd>exe ':TodoTrouble cwd=' .. fnameescape(expand('%:p'))<cr>", "TODO" },
  T = { "<cmd>Trouble todo<cr>", "TODO worspace" },
}

-- Git extra bindings
lvim.builtin.which_key.mappings.g.L = { "<cmd>G blame<CR>", ":G blame" }
lvim.builtin.which_key.mappings.g.O = { "<cmd>G difftool HEAD~1<CR>", "Changes in last commit" }

-- Terminal mappings
require('usr.plugin-settings.toggleterm')

-- Debuger mappings on usr.plugin-config.dap

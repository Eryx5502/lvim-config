local M = {}

function M.textobjects_setup()
  require 'nvim-treesitter.configs'.setup {
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          -- You can optionally set descriptions to the mappings (used in the desc parameter of
          -- nvim_buf_set_keymap) which plugins like which-key display
          ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          -- You can also use captures from other query groups like `locals.scm`
          ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        },
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V',  -- linewise
          ['@class.outer'] = '<c-v>', -- blockwise
        },
        include_surrounding_whitespace = true,
      },
      move = {
        enable = true,
        set_jumps = false, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]]"] = "@function.outer",
          -- ["]["] = "@function.outer",
          ["]o"] = "@loop.outer",
          -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        },
        goto_next_end = {
          ["]["] = "@function.outer",
          -- ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[["] = "@function.outer",
          -- ["[]"] = "@function.outer",
        },
        goto_previous_end = {
          ["[]"] = "@function.outer",
          -- ["[]"] = "@class.outer",
        },
        goto_next = {
          ["]d"] = "@conditional.outer",
        },
        goto_previous = {
          ["[d"] = "@conditional.outer",
        },
      },
      lsp_interop = {
        enable = true,
        border = 'none',
        peek_definition_code = {
          ["gpf"] = "@function.outer",
          ["gpc"] = "@class.outer",
        },
      },
    },
  }
end

return M

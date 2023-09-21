local vim = vim
local api = vim.api
local M = {}
-- function to create a list of commands and convert them to autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
function M.nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        api.nvim_command('augroup '..group_name)
        api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            api.nvim_command(command)
        end
        api.nvim_command('augroup END')
    end
end


local autoCommands = {
  -- other autocommands
  -- folds = {
  --   {"BufReadPost,FileReadPost", "*", "normal zR"},
  --   -- to save and load views (i.e., the folded/unfolded state of folds)
  --   -- {"BufWinLeave", "*.*", "silent mkview"},
  --   -- {"BufWinEnter", "*.*", "silent! loadview"}
  -- },
  tsc_make = {
    {"Filetype", "typescript,typescriptreact,javascript", [[setlocal makeprg=npx\ tsc\ \\\|\ sed\ 's/(\\(.*\\),\\(.*\\)):/:\\1:\\2:/']]}
  }
}

M.nvim_create_augroups(autoCommands)

return M

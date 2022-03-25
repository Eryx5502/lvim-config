  local autopairs = require "nvim-autopairs"
  local Rule = require "nvim-autopairs.rule"
  local cond = require "nvim-autopairs.conds"

  -- autopairs.add_rule(Rule("$$", "$$", "tex"))
  autopairs.add_rules {
    Rule("$", "$", { "tex", "latex" }) -- don't add a pair if the next character is %
  --     :with_pair(cond.not_after_regex_check "%%") -- don't add a pair if  the previous character is xxx
  --     :with_pair(cond.not_before_regex_check("xxx", 3)) -- don't move right when repeat character
  --     :with_move(cond.none()) -- don't delete if the next character is xx
  --     :with_del(cond.not_after_regex_check "xx") -- disable  add newline when press <cr>
  --     :with_cr(cond.none()),
  }
  -- autopairs.add_rules {
  --   Rule("$$", "$$", "tex"):with_pair(function(opts)
  --     print(vim.inspect(opts))
  --     if opts.line == "aa $$" then
  --       -- don't add pair on that line
  --       return false
  --     end
  --   end),
  -- }

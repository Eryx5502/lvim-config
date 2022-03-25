local luasnip = require('luasnip')
local cmp = require('cmp')

-- Every unspecified option will be set to the default.
luasnip.config.set_config({
  history = true,
  -- Update more often, :h events for more info.
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
})

luasnip.snippets = {
  all = {},
  html = {},
}

require('snippets')

-- enable html snippets in javascript/javascript(REACT)
luasnip.snippets.javascript = luasnip.snippets.html
luasnip.snippets.javascriptreact = luasnip.snippets.html
luasnip.snippets.typescriptreact = luasnip.snippets.html

-- You can also use lazy loading so you only get in memory snippets of languages you use
require('luasnip/loaders/from_vscode').lazy_load({ include = { 'html' } })

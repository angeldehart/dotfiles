local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {
	s("%", {
	    t("{% "), i(0), t(" %}")	
	})
}

return snippets

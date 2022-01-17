local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {
	-- snippets as usual
	s("cl", {
			t("consol.log("), i(1), t(");"),
		})
}

return snippets

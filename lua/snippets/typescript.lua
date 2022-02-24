local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {
	-- snippets as usual
	s("cl", {
			t("console.log("), i(1), t(");")
		}),
	s({trig="im", name="IMPORT STMT"}, {
			t("import "), i(2), t(" from '"), i(1), t("';")
	})
}

return snippets

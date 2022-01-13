local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {
	-- snippets as usual
	s("snip", {
			t("s(\""), i(1, "trigger"), t({"\", {", ""}),
			t("    "), i(0), t({"\t", ""}),
			t("})")
		})
}

return snippets

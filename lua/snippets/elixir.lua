local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {
	-- snippets as usual
	s("defn", {
			t("defn "), i(1, "fn_name"), t("("), i(2, "args"), t({") do:", ""})
		})
}

return snippets

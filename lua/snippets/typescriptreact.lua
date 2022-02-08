local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local snippets = {
	-- snippets as usual
	s("im", {
        t("import "), i(2), t(" from "), i(1)
		}),

	s("ir", {t("import React from 'react';")})
}

return snippets

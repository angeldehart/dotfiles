local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("ir", { t("import React from 'react';") }),
  s("us", {
    t("const ["), i(1), t("] = React.useState("), i(0), t(")")
  })
}

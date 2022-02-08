local luasnip = require'luasnip'
luasnip.filetype_extend("python", {"django"})
luasnip.filetype_extend("typescript", {"react-ts"})
luasnip.filetype_extend("javascript", {"typescript"})
luasnip.filetype_extend("typescriptreact", {"typescript"})
require("luasnip.loaders.from_vscode").load()

-- Edit particular filetype snippets

function _G.snippets_clear()
	for m, _ in pairs(luasnip.snippets) do
		package.loaded["snippets."..m] = nil
	end
	luasnip.snippets = setmetatable({}, {
		__index = function(t, k)
			local ok, m = pcall(require, "snippets." .. k)
			if not ok and not string.match(m, "^module.*not found:") then
				error(m)
			end
			t[k] = ok and m or {}
			return t[k]
		end
	})
end

_G.snippets_clear()

vim.cmd [[
augroup snippets_clear
au!
au BufWritePost ~/.config/nvim/lua/snippets/*.lua lua _G.snippets_clear()
augroup END
]]

function _G.edit_ft()
	-- returns table like {"lua", "all"}
	local fts = require("luasnip.util.util").get_snippet_filetypes()
	vim.ui.select(fts, {
		prompt = "Select which filetype to edit:"
	}, function(item, idx)
		-- selection aborted -> idx == nil
		if idx then
			vim.cmd("edit ~/.config/nvim/lua/snippets/"..item..".lua")
		end
	end)
end

vim.cmd [[command! LuaSnipEdit :lua _G.edit_ft()]]

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

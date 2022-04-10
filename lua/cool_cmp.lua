local cmp = require'cmp'
local snippy = require("snippy")

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

vim.cmd [[ autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} }) ]]

cmp.setup({
		snippet = {
			expand = function(args)
				require('snippy').expand_snippet(args.body)
			end,
		},
		sources = cmp.config.sources({
				{name = 'snippy'},
				{name = 'nvim_lsp'},
				{name = 'buffer'},
				{name = 'other'},
				{name = 'path'},
				{name = 'vim-dadbod-completion'}
			}),
		mapping = {
			["<cr>"] = cmp.mapping.confirm(),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif snippy.can_expand_or_advance() then
					snippy.expand_or_advance()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
     if cmp.visible() then
        cmp.select_prev_item()
      elseif snippy.can_jump(-1) then
        snippy.previous()
      else
        fallback()
      end
		end, { "i", "s" })
	}
})

-- ANGEL CAMPBELL'S WONDERFUL HORRIBLE VIM CONFIG

-- settings
vim.g.maplocalleader = ","
vim.g.qf_join_changes = true
vim.o.guifont = "mononoki Nerd Font Mono:h22"
vim.o.hlsearch = false
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.o.autochdir = false
vim.o.clipboard = "unnamedplus"
vim.o.relativenumber = true
vim.o.foldmethod = "expr"
vim.o.foldlevel = 99
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.g.netrw_banner = 0
vim.o.background = "dark"
vim.cmd([[colo base16-tomorrow-night]])
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	float = { border = "single" },
})
-- see https://github.com/nvim-telescope/telescope.nvim/issues/699
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*" },
	command = "silent! :%foldopen!",
})

-- keymappings
vim.g.mapleader = " "
vim.g.maplocalleader = ","
-- windows
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")
-- resize
vim.keymap.set("n", "<Left>", ":vertical res -5<CR>")
vim.keymap.set("n", "<Right>", ":vertical res +5<CR>")
vim.keymap.set("n", "<Up>", ":res +5<CR>")
vim.keymap.set("n", "<Down>", ":res -5<CR>")
-- terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")
-- lsp
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<localleader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<localleader>r", vim.lsp.buf.rename)
vim.keymap.set("v", "<localleader>a", vim.lsp.buf.code_action)
vim.keymap.set("n", "<localleader>a", vim.lsp.buf.code_action)
vim.keymap.set("n", "<localleader>e", vim.diagnostic.open_float)
-- others
vim.keymap.set("i", "<C-c>", "<ESC>")
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("n", "!", ":!")
vim.keymap.set("n", "-", ":25Lex %:h<CR>")
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("n", "<BS>", ":b#<CR>")
vim.keymap.set("n", "?", "?\\v")
vim.keymap.set("n", "H", "gT")
vim.keymap.set("n", "L", "gt")
vim.keymap.set("n", "Q", "@q")
vim.keymap.set("n", "Z", "zA")
vim.keymap.set("n", "q:", ":q")

-- Leader mappings
vim.keymap.set("n", "<leader>/", ":<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>;", ":Telescope commands<CR>")
vim.keymap.set("n", "<leader><CR>", ":")
vim.keymap.set("n", "<leader><leader>", ":")
vim.keymap.set("n", "<leader>a", ":te<CR>")
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>c", ":Telescope treesitter<CR>")
vim.keymap.set("n", "<leader>d", ":25Lex<CR>")
vim.keymap.set("n", "<leader>e", ':e <C-R>=expand("%:p:h")<CR>/<C-n>')
vim.keymap.set("n", "<leader>f", ":Telescope git_files<CR>")
vim.keymap.set("n", "<leader>gd", ":Git diff main...HEAD %<CR>")
vim.keymap.set("n", "<leader>gg", ":Git<CR>")
vim.keymap.set("n", "<leader>h", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>i", ":echom unused<CR>")
vim.keymap.set("n", "<leader>jj", ':Telescope find_files search_dirs={"~/Dropbox/notes"}<CR>')
vim.keymap.set("n", "<leader>js", ":e ~/.local/scratch.md<CR>")
vim.keymap.set("n", "<leader>k", ":q<CR>")
vim.keymap.set("n", "<leader>ll", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>m", ":Telescope oldfiles<CR>")
vim.keymap.set("n", "<leader>n", ":tabe<CR>")
vim.keymap.set("n", "<leader>o", ":Telescope current_buffer_fuzzy_find<CR>")
vim.keymap.set("n", "<leader>p", ":cw<CR>")
vim.keymap.set("n", "<leader>q", ":qa<CR>")
vim.keymap.set("n", "<leader>r", ":%s/")
vim.keymap.set("n", "<leader>sh", ":vsplit<CR><C-w>h")
vim.keymap.set("n", "<leader>sj", ":split<CR>")
vim.keymap.set("n", "<leader>sk", ":split<CR><C-w>k")
vim.keymap.set("n", "<leader>sl", ":vsplit<CR>")
vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>")
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>")
vim.keymap.set("n", "<leader>ti", ":TestVisit<CR>")
vim.keymap.set("n", "<leader>va", ":e ~/dotfiles/.bash_aliases<CR>")
vim.keymap.set("n", "<leader>vd", ":e ~/local-init.lua<CR>")
vim.keymap.set("n", "<leader>vk", ":e ~/.config/kitty/kitty.conf<CR>")
vim.keymap.set("n", "<leader>vl", ":e .nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>vv", ":e ~/.config/lvim/config.lua<CR>")
vim.keymap.set("n", "<leader>vt", ":e ~/dotfiles/.tmux.conf<CR>")
vim.keymap.set("n", "<leader>vz", ":e ~/dotfiles/.zshrc<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>x", function()
	require("luasnip.loaders").edit_snippet_files(nil)
end)
vim.keymap.set("n", "<leader>y", ':let @+ = expand("%")<cr>')
vim.keymap.set("n", "<leader>z", function()
	if vim.wo.foldlevel > 0 then
		vim.wo.foldlevel = 0
	else
		vim.wo.foldlevel = 99
	end
end)

-- packages
vim.cmd([[packadd packer.nvim]])
vim.cmd([[packadd cfilter]])
require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- cosmetic
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup()
		end,
	})

	-- testing
	use("vim-test/vim-test")
	vim.g["test#strategy"] = "neovim"

	-- snippets
	use("SirVer/ultisnips")

	-- LSP
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("quangnguyen30192/cmp-nvim-ultisnips")
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "ultisnips" },
				}),
				mapping = {
					["<CR>"] = function(fallback)
						if cmp.visible() then
							cmp.confirm()
						else
							fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
						end
					end,

					["<Tab>"] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end,
				},
			})
		end,
	})
	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({})
		end,
	})
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			local lsp = require("lspconfig")
			lsp.jsonls.setup({
				cmd = { "vscode-json-languageserver", "--stdio" },
			})
			lsp["terraformls"].setup({})
			lsp["tsserver"].setup({})
			lsp["eslint"].setup({
				settings = {
					autoFixOnSave = true,
				},
			})
		end,
	})

	use("ray-x/lsp_signature.nvim")
	use("RRethy/nvim-base16")
	use({
		"jose-elias-alvarez/typescript.nvim",
		config = function()
			require("typescript").setup({})
		end,
	})

	-- Navigation
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("stefandtw/quickfix-reflector.vim")

	use("ryanoasis/vim-devicons")
	use({
		"ggandor/lightspeed.nvim",
		config = function()
			require("lightspeed").setup({ ignore_case = true })
		end,
	})

	-- Utility
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("jpalardy/vim-slime")
	vim.g.slime_target = "neovim"
	use("tpope/vim-rsi") -- emacs readline bindings
	use("tpope/vim-fugitive") -- git
	use("tpope/vim-rhubarb") -- github
	use("tpope/vim-abolish") -- substitution
	use("tpope/vim-dadbod") -- databases
	use("kristijanhusak/vim-dadbod-ui")
	use("kristijanhusak/vim-dadbod-completion")
	use("tpope/vim-dispatch") -- used by other plugins
	use("radenling/vim-dispatch-neovim") -- no one knows
	use("tpope/vim-surround") -- ysiw
	use("tpope/vim-commentary") -- comments
	use("tpope/vim-repeat") -- better .
	use("tpope/vim-sensible") -- good defaults
	use("sheerun/vim-polyglot") -- all languages
	use("nvim-treesitter/nvim-treesitter")

	vim.g.AutoPairsMapCR = 0
	vim.cmd([[au! FileType fugitive nm <buffer> <TAB> =]])
	vim.cmd([[au! FileType netrw nm <buffer> <C-l> <C-w>l]])
	vim.cmd([[au! BufEnter *.heex setlocal ft=eelixir]])
	vim.cmd([[au TermOpen * setlocal nonumber norelativenumber bufhidden=hide]])

	-- Web
	use("mattn/emmet-vim")
	vim.g.user_emmet_settings = {
		javascript = { extends = "jsx" },
		javascriptreact = { extends = "jsx" },
		typescriptreact = { extends = "jsx" },
	}

	-- Etc
	use("editorconfig/editorconfig-vim")
end)
vim.cmd([[filetype plugin indent on]])
vim.cmd([[syntax enable]])

vim.cmd([[ au! bufwritepost init.lua source % ]])
if vim.fn.filereadable("./.nvim/init.lua") == 1 then
	dofile("./.nvim/init.lua")
end

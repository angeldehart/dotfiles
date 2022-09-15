-- ANGEL CAMPBELL'S WONDERFUL HORRIBLE VIM CONFIG

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
vim.g.maplocalleader = ','
vim.g.python3_host_prog = "~/.config/nvim/venv/bin/python"
vim.g.qf_join_changes = true
vim.o.hlsearch = false
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.o.autochdir = false
vim.o.foldmethod = "expr"
vim.o.foldlevel = 99
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
-- see https://github.com/nvim-telescope/telescope.nvim/issues/699
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   pattern = { "*" },
--   command = "silent! :%foldopen!",
-- })
vim.g["test#strategy"] = "floaterm"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.localleader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["gd"] = vim.lsp.buf.definition
lvim.keys.normal_mode['K'] = vim.lsp.buf.hover
lvim.keys.normal_mode['gr'] = vim.lsp.buf.references
lvim.keys.normal_mode['<localleader>f'] = vim.lsp.buf.formatting_sync
lvim.keys.normal_mode['<localleader>r'] = vim.lsp.buf.rename
lvim.keys.normal_mode['<localleader>a'] = vim.lsp.buf.code_action
lvim.keys.normal_mode['<localleader>e'] = vim.diagnostic.open_float

lvim.keys.normal_mode['<C-j>'] = '<C-W>j'
lvim.keys.normal_mode['<C-k>'] = '<C-W>k'
lvim.keys.normal_mode['<C-h>'] = '<C-W>h'
lvim.keys.normal_mode['<C-l>'] = '<C-W>l'

-- Arrows resize
lvim.keys.normal_mode['<Left>'] = ':vertical res -5<CR>'
lvim.keys.normal_mode['<Right>'] = ':vertical res +5<CR>'
lvim.keys.normal_mode['<Up>'] = ':res +5<CR>'
lvim.keys.normal_mode['<Down>'] = ':res -5<CR>'

lvim.keys.normal_mode['-'] = ':25Lex %:h<CR>'
lvim.keys.normal_mode['Q'] = '@q'
lvim.keys.normal_mode['/'] = '/\\v'
lvim.keys.normal_mode['?'] = '?\\v'
lvim.keys.normal_mode['H'] = 'gT'
lvim.keys.normal_mode['L'] = 'gt'
lvim.keys.normal_mode['!'] = ':!<C-n>'
lvim.keys.normal_mode['q:'] = ':q'
lvim.keys.normal_mode['Z'] = 'zA'
lvim.keys.normal_mode['<BS>'] = ':b#<CR>'
lvim.keys.normal_mode['<Left>'] = ':vertical res -5<CR>'
lvim.keys.normal_mode['<Right>'] = ':vertical res +5<CR>'
lvim.keys.normal_mode['<Up>'] = ':res +5<CR>'
lvim.keys.normal_mode['<Down>'] = ':res -5<CR>'

lvim.keys.insert_mode['jj'] = '<ESC>'

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')
vim.cmd [[au TermOpen * setlocal nonumber norelativenumber bufhidden=hide]]

-- Dash
lvim.keys.visual_mode['<C-i>'] = ':<C-U>DashWord<CR>'

-- Leader mappings
lvim.keys.normal_mode['<leader>/'] = ':<cmd>Telescope live_grep<CR>'
lvim.keys.normal_mode['<leader>;'] = ':Telescope commands<CR>'
lvim.keys.normal_mode['<leader><CR>'] = ':'
lvim.keys.normal_mode['<leader><leader>'] = ':b#<CR>'
lvim.keys.normal_mode['<leader>a'] = ':te<CR>'
lvim.keys.normal_mode['<leader>b'] = ':Telescope buffers<CR>'
lvim.keys.normal_mode['<leader>c'] = ':Telescope treesitter<CR>'
lvim.keys.normal_mode['<leader>d'] = ':25Lex<CR>'
lvim.keys.normal_mode['<leader>e'] = ':e <C-R>=expand("%:p:h")<CR>/<C-n>'
lvim.keys.normal_mode['<leader>f'] = ':Telescope git_files<CR>'
lvim.keys.normal_mode['<leader>gd'] = ':Git diff master...HEAD<CR>'
lvim.keys.normal_mode['<leader>gg'] = ':Git<CR>'
lvim.keys.normal_mode['<leader>h'] = ':Telescope help_tags<CR>'
lvim.keys.normal_mode['<leader>i'] = ':Dash<CR>'
lvim.keys.normal_mode['<leader>jj'] = ':Telescope find_files search_dirs={"~/Dropbox/notes"}<CR>'
lvim.keys.normal_mode['<leader>js'] = ':e ~/.local/scratch.md<CR>'
lvim.keys.normal_mode['<leader>k'] = ':q<CR>'
lvim.keys.normal_mode['<leader>ll'] = vim.diagnostic.open_float
lvim.keys.normal_mode['<leader>ln'] = vim.diagnostic.goto_next
lvim.keys.normal_mode['<leader>lp'] = vim.diagnostic.goto_prev
lvim.keys.normal_mode['<leader>m'] = ':Telescope oldfiles<CR>'
lvim.keys.normal_mode['<leader>n'] = ':tabe<CR>'
lvim.keys.normal_mode['<leader>o'] = ':Telescope current_buffer_fuzzy_find<CR>'
lvim.keys.normal_mode['<leader>p'] = ':cw<CR>'
lvim.keys.normal_mode['<leader>q'] = ':qa<CR>'
lvim.keys.normal_mode['<leader>r'] = ':%s/'
lvim.keys.normal_mode['<leader>sh'] = ':vsplit<CR>'
lvim.keys.normal_mode['<leader>sj'] = ':split<CR><C-W>j'
lvim.keys.normal_mode['<leader>sk'] = ':split<CR>'
lvim.keys.normal_mode['<leader>sl'] = ':vsplit<CR><C-W>l'
lvim.keys.normal_mode['<leader>tt'] = ':TestNearest<CR>'
lvim.keys.normal_mode['<leader>tf'] = ':TestFile<CR>'
lvim.keys.normal_mode['<leader>ti'] = ':TestVisit<CR>'
lvim.keys.normal_mode['<leader>va'] = ':e ~/dotfiles/.bash_aliases<CR>'
lvim.keys.normal_mode['<leader>vk'] = ':e ~/.config/kitty/kitty.conf<CR>'
lvim.keys.normal_mode['<leader>vl'] = ':e .nvim/init.lua<CR>'
lvim.keys.normal_mode['<leader>vv'] = ':e ~/.config/lvim/config.lua<CR>'
lvim.keys.normal_mode['<leader>vt'] = ':e ~/dotfiles/.tmux.conf<CR>'
lvim.keys.normal_mode['<leader>vz'] = ':e ~/dotfiles/.zshrc<CR>'
lvim.keys.normal_mode['<leader>w'] = ':w<CR>'
lvim.keys.normal_mode['<leader>y'] = function() require("luasnip.loaders").edit_snippet_files(nil) end
lvim.keys.normal_mode['<leader>y'] = ':let @+ = expand("%")<cr>'
lvim.keys.normal_mode['<leader>z'] = function() if vim.wo.foldlevel > 0 then vim.wo.foldlevel = 0 else vim.wo.foldlevel = 99 end end

vim.cmd [[au TermOpen * setlocal nonumber norelativenumber bufhidden=hide]]

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = false
lvim.builtin.notify.active = false
lvim.builtin.terminal.active = false
lvim.builtin.nvimtree.active = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
}

require('lvim.lsp.null-ls.code_actions').setup({
  {
    exe = "eslint",
    filetypes = {
      "javascript", "vue", "typescript", "javascriptreact", "typescriptreact", "json"
    }
  }
})
-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
vim.cmd [[packadd cfilter]]
lvim.plugins = {
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-abolish' },
  { 'tpope/vim-vinegar' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  { 'jpalardy/vim-slime' },
  { 'hashivim/vim-terraform' },
  { 'tpope/vim-dadbod' },
  { 'kristijanhusak/vim-dadbod-ui' },
  { 'kristijanhusak/vim-dadbod-completion' },
  { 'mattn/emmet-vim' },
  { 'stefandtw/quickfix-reflector.vim' },
  { 'justinmk/vim-sneak' },
  { 'mracos/mermaid.vim' },
  { 'vim-test/vim-test' },
  { 'voldikss/vim-floaterm' },
  { 'ray-x/lsp_signature.nvim' },
  { 'rcarriga/nvim-dap-ui' },
  { 'udalov/kotlin-vim' },
  { 'mrjones2014/dash.nvim', run = 'make install' },
  { 'catppuccin/nvim' }
}

--- Set up plugins
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup()
lvim.colorscheme = "catppuccin"

vim.g.user_emmet_settings = {
  javascript = { extends = 'jsx' },
  javascriptreact = { extends = 'jsx' },
  typescriptreact = { extends = 'jsx' },
}
vim.g.slime_target = "neovim"

local project = lvim.builtin.project
project.manual_mode = true

require("lsp_signature").setup({})
require("dapui").setup({})
local dap = require('dap')
dap.adapters.node = { type = 'executable', command = os.getenv("HOME") .. '/.asdf/shims/node' }
dap.adapters.node = { type = 'executable', command = os.getenv("HOME") .. '/.asdf/shims/python' }
dap.adapters.elixir = { type = 'executable', command = os.getenv("HOME") .. '/.asdf/shims/elixir' }

lvim.builtin.terminal.active = false
lvim.builtin.bufferline.active = false
lvim.builtin.which_key.active = false
lvim.builtin.dap.active = true


vim.g["sneak#label"] = true
vim.g["sneak#use_ic_ics"] = true


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

-- Local config
if vim.fn.filereadable("./.nvim/init.lua") == 1 then
  dofile("./.nvim/init.lua")
end

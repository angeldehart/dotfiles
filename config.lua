--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
vim.g.maplocalleader = ','
vim.g.python3_host_prog = "~/.config/nvim/venv/bin/python"
vim.o.hlsearch = false
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
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

lvim.keys.normal_mode['-'] = ':NvimTreeFindFile<CR>'
lvim.keys.normal_mode['Q'] = '@q'
lvim.keys.normal_mode['/'] = '/\\v'
lvim.keys.normal_mode['?'] = '?\\v'
lvim.keys.normal_mode['H'] = 'gT'
lvim.keys.normal_mode['L'] = 'gt'
lvim.keys.normal_mode['!'] = ':!'
lvim.keys.normal_mode['q:'] = ':q'
lvim.keys.normal_mode['Z'] = 'zA'
lvim.keys.normal_mode['<BS>'] = ':b#<CR>'
lvim.keys.insert_mode['<C-c>'] = '<ESC>'
lvim.keys.insert_mode['jj'] = '<ESC>'
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')
vim.cmd [[au TermOpen * setlocal nonumber norelativenumber bufhidden=hide]]

-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }
lvim.builtin.which_key.mappings = {}
lvim.builtin.which_key.mappings['/'] = { ':<cmd>Telescope live_grep<CR>', 'Grep' }

lvim.builtin.which_key.mappings[';'] = { ':Telescope commands<CR>', 'Commands' }
lvim.builtin.which_key.mappings['<CR>'] = { ':', ':' }
lvim.builtin.which_key.mappings['<leader>'] = { ':b#<CR>' }
lvim.builtin.which_key.mappings['a'] = { ':te<CR>', 'Terminal' }
lvim.builtin.which_key.mappings['b'] = { ':Telescope buffers<CR>', 'Buffers' }
lvim.builtin.which_key.mappings['c'] = { ':Telescope treesitter<CR>', 'Treesitter' }
lvim.builtin.which_key.mappings['d'] = { ':NvimTreeToggle<CR>', 'Explorer' }
lvim.builtin.which_key.mappings['e'] = { ':e <C-R>=expand("%:p:h"} . "/" <CR>', 'Expand' }
lvim.builtin.which_key.mappings['f'] = { ':Telescope git_files<CR>', 'Files' }
lvim.builtin.which_key.mappings['g'] = { ':Git<CR>', 'Git' }
lvim.builtin.which_key.mappings['h'] = { ':Telescope help_tags<CR>', 'Help' }
-- lvim.builtin.which_key.mappings['i'] = { ':echom "UNUSED"<CR>', 'UNUSED' }
lvim.builtin.which_key.mappings['j'] = {
  name = "+Notes",
  d = { ':e ~/Dropbox/notes/dashboard.md<CR>', 'Dashboard' },
  j = { ':Telescope find_files search_dirs={"~/Dropbox/notes"}<CR>', 'Search' },
  s = { ':e /tmp/scratch.md<CR>', 'Scratch' },
  t = { ':e ~/notes/todo.txt<CR>', 'TODO' }

}
lvim.builtin.which_key.mappings['k'] = { ':q<CR>', 'Quit' }
lvim.builtin.which_key.mappings['l'] = {
  name = "+Diagnostics",
  n = { vim.diagnostic.goto_next, 'Next' },
  l = { vim.diagnostic.open_float, 'Open' },
  p = { vim.diagnostic.goto_prev, 'Prev' },

}
lvim.builtin.which_key.mappings['m'] = { ':Telescope oldfiles<CR>', 'Oldfiles' }
lvim.builtin.which_key.mappings['n'] = { ':tabe %%<CR>', 'Tab' }
lvim.builtin.which_key.mappings['p'] = { ':cw<CR>', 'Quickfix' }
lvim.builtin.which_key.mappings['q'] = { ':qa<CR>', 'Quit all' }
lvim.builtin.which_key.mappings['r'] = { ':%s/', 'Replace' }
lvim.builtin.which_key.mappings['s'] = {
  name = '+Split',
  h = { ':vsplit<CR>', 'Left' },
  j = { ':split<CR><C-W>j', 'Up' },
  k = { ':split<CR>', 'Down' },
  l = { ':vsplit<CR><C-W>l', 'Right' },
}

lvim.builtin.which_key.mappings['v'] = {
  name = '+Config Files',
  a = { ':e ~/dotfiles/.bash_aliases<CR>', 'Aliases' },
  k = { ':e ~/.config/kitty/kitty.conf<CR>', 'Kitty' },
  l = { ':e .nvim/init.lua<CR>', 'Local Config' },
  v = { ':e ~/.config/lvim/config.lua<CR>', 'Config' },
  t = { ':e ~/dotfiles/.tmux.conf<CR>', 'Tmux' },
  z = { ':e ~/dotfiles/.zshrc<CR>', 'Zsh' },
}

lvim.builtin.which_key.mappings['w'] = { ':w<CR>', 'Save' }
lvim.builtin.which_key.mappings['z'] = { function()
  if vim.o.foldlevel > 0 then
    vim.o.foldlevel = 0
  else
    vim.o.foldlevel = 99
  end
end, 'Fold' }

vim.cmd [[au TermOpen * setlocal nonumber norelativenumber bufhidden=hide]]

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

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
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

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
lvim.plugins = {
  { "tpope/vim-fugitive" },
  { "tpope/vim-abolish" },
  { "tpope/vim-surround" },
  { "hashivim/vim-terraform" },
  { 'tpope/vim-dadbod' },
  { 'kristijanhusak/vim-dadbod-ui' },
  { 'kristijanhusak/vim-dadbod-completion' }
}

lvim.builtin.terminal.active = false
lvim.builtin.bufferline.active = false

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

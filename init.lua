-- ==*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
-- *=*=*=*=*=*=*=*=*=*=*=*=*=*=*==*=COLBY=DEHART'S=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
-- *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=WONDERFUL=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
-- *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=HORRIBLE*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
-- *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=INIT.LUA*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
-- *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=

-- Settings
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.wildignorecase = true
vim.o.timeoutlen = 500
vim.o.number = true
vim.o.hlsearch = false
vim.o.relativenumber = true
vim.g.foldmethod = syntax
vim.o.foldlevel = 99
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.python3_host_prog = "~/.config/nvim/venv/bin/python"

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    float = { border = "single" },
})

-- Ignore
vim.opt.wildignore = {
  "*/_build",
  "*.pyc",
  "*/node_modules/*",
  ".git",
  ".venv",
  "*.bs.js",
  ".DS_Store",
}


-- Packages
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Cosmetic
  use 'itchyny/lightline.vim'
  use 'mechatroner/rainbow_csv'
  use 'liuchengxu/vim-which-key'
  use 'savq/melange'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'tamago324/nlsp-settings.nvim'
  local lsp = require'lspconfig'
  lsp.pyright.setup{}
  lsp.bashls.setup{}
  lsp.dockerls.setup{}
  lsp.elixirls.setup{
    cmd = {vim.fn.expand("~/.local/bin/elixir-ls/release/language_server.sh")}
  }
  lsp.jsonls.setup{}
  lsp.pyright.setup{}
  lsp.sqlls.setup{}
  lsp.terraformls.setup{}
  lsp.tsserver.setup{}

  -- Navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'glepnir/dashboard-nvim'
  vim.g.dashboard_default_executive = 'telescope'

  vim.g.dashboard_custom_footer = {"Destroy things with neovim"}
  vim.g.dashboard_custom_header = {
    '          ▀████▀▄▄              ▄█ ',
    '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
    '    ▄        █          ▀▀▀▀▄  ▄▀  ',
    '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
    '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
    '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
    '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
    '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
    '   █   █  █      ▄▄           ▄▀   ',
  }

  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"

  local luasnip = require'luasnip'
  require('cool_luasnip')

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  local cmp = require'cmp'
  cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
          {name = 'nvim_lsp'},
          {name = 'luasnip'},
          {name = 'buffer'}
        }),
      mapping = {
        ["<cr>"] = cmp.mapping.confirm(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" })
    }
  })



  -- Utility
  use 'windwp/nvim-autopairs'
  use 'jpalardy/vim-slime'
  vim.g.slime_target = "neovim"
  -- Change this to use slime with ipython
  vim.g.slime_python_ipython = 0
  use 'tpope/vim-rsi' -- emacs readline bindings
  use 'tpope/vim-fugitive' -- git
  use 'tpope/vim-rhubarb' -- github
  use 'tpope/vim-abolish' -- substitution
  use 'tpope/vim-dadbod' -- databases
  use 'tpope/vim-dispatch' -- used by other plugins
  use 'radenling/vim-dispatch-neovim'
  use 'tpope/vim-vinegar' -- netrw+
  use 'tpope/vim-surround' -- ysiw
  use 'tpope/vim-commentary' -- comments
  use 'tpope/vim-repeat' -- better .
  use 'tpope/vim-sensible' -- good defaults
  use 'sheerun/vim-polyglot'
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  vim.g.AutoPairsMapCR = 0
  vim.g.neoterm_repl_enable_ipython_paste_magic = 1
  vim.cmd [[au! FileType fugitive nm <buffer> <TAB> =]]
  require('nvim-autopairs').setup{}
  vim.cmd [[au! BufEnter *.heex setlocal ft=eelixir]]

  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))


  -- Web
  use 'stephenway/postcss.vim'
  use 'mattn/emmet-vim'
  vim.g.user_emmet_settings = {
    javascript = {extends = 'jsx'},
    javascriptreact = {extends = 'jsx'},
    typescript = {extends = 'jsx'},
    typescriptreact = {extends = 'jsx'},
  }

  -- Etc
  use 'editorconfig/editorconfig-vim'
  use {"akinsho/toggleterm.nvim", config = function() require('toggleterm').setup() end}
  use {"folke/persistence.nvim", config = function() require('persistence').setup() end}
end)


vim.o.background = 'dark'
vim.cmd [[colo melange]]
vim.cmd [[filetype plugin indent on]]
vim.cmd [[syntax enable]]

-- Bindings
local map = vim.keymap.set
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'K', vim.lsp.buf.hover)
map('n', 'gr', vim.lsp.buf.references)
map('n', '<localleader>f', vim.lsp.buf.formatting)
map('n', '<localleader>r', vim.lsp.buf.rename)
map('n', '<localleader>a', vim.lsp.buf.code_action)
map('n', '<localleader>e', vim.diagnostic.open_float)

map('n', '<leader>', ':<c-u>WhichKey "<Space>"<CR>')
map('n', '<localleader>', ':<c-u>WhichKey ","<CR>')
map('n', '<leader>/', ':Telescope live_grep<CR>')
map('n', '<leader>;', ':Telescope commands<CR>')
map('n', '<leader><CR>', ':')
map('n', '<leader><leader>', ':b#<CR>')
map('n', '<leader>a', ':ZenMode<CR>')
map('n', '<leader>b', ':Telescope lsp_document_symbols<CR>')
map('n', '<leader>c', ':Telescope treesitter<CR>')
map('n', '<leader>d', ':Vexplore! .<CR>')
map('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>')
map('n', '<leader>f', ':Telescope git_files<CR>')
map('n', '<leader>g', ':Git<CR>')
map('n', '<leader>h', ':Telescope help_tags<CR>')
map('n', '<leader>i', ':echom "UNUSED"<CR>')
-- map('n', '<leader>jc' ':call CondenseLog()<CR>') TODO: use org mode
-- map('n', '<silent> <leader>jl' ':call OpenLog()<CR>')
map('n', '<silent> <leader>jj', ':Telescope find_files search_dirs={"~/notes"}<CR>')
map('n', '<silent> <leader>js', ':e ~/notes/scratch.md<CR>')
map('n', '<silent> <leader>jt', ':e ~/notes/todo.txt<CR>')
map('n', '<leader>k', ':q<CR>')
-- map('n', '<leader>ln', vim.diagnostic.goto_next)
-- map('n', '<leader>ll', vim.diagnostic.open_float)
-- map('n', '<leader>lp', vim.diagnostic.goto_prev)
map('n', '<leader>m', ':Telescope oldfiles<CR>')
map('n', '<leader>n', ':tabe<CR>')
map('n', '<leader>o', ':echom "UNUSED"<CR>')
map('n', '<leader>p', ':cw<CR>')
map('n', '<leader>q', ':qa<CR>')
map('n', '<leader>ra', ':%s/')
map('n', '<leader>rr', ':s/')
map('n', '<leader>sh', ':vsplit<CR>')
map('n', '<leader>sj', ':split<CR><C-W>j')
map('n', '<leader>sk', ':split<CR>')
map('n', '<leader>sl', ':vsplit<CR><C-W>l')
map('n', '<leader>t', ':ToggleTerm<CR>')
map('n', '<leader>u', ':echom "UNUSED"<CR>')
map('n', '<leader>va', ':e ~/dotfiles/.bash_aliases<CR>')
map('n', '<leader>vk', ':e ~/.config/kitty/kitty.conf<CR>')
map('n', '<leader>vl', ':e ./.lvimrc<CR>')
map('n', '<leader>vv', ':e ~/.config/nvim/init.lua<CR>')
map('n', '<leader>vt', ':e ~/dotfiles/.tmux.conf<CR>')
map('n', '<leader>vu', ':e ~/dotfiles/init.lua<CR>')
map('n', '<leader>vz', ':e ~/dotfiles/.zshrc<CR>')
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>x', 'mzgggqG`z')
map('n', '<leader>y', ':LuaSnipEdit<CR>')
map('n', '<leader>z', function() 
  if vim.o.foldlevel > 0 then
    vim.o.foldlevel = 0
  else
    vim.o.foldlevel = 99
  end 
end)

-- Window navigation
map('n', '<C-j>', '<C-W>j')
map('n', '<C-k>', '<C-W>k')
map('n', '<C-h>', '<C-W>h')
map('n', '<C-l>', '<C-W>l')

-- Arrows resize
map('n', '<Left>', ':vertical res -5<CR>')
map('n', '<Right>', ':vertical res +5<CR>')
map('n', '<Up>', ':res +5<CR>')
map('n', '<Down>', ':res -5<CR>')

-- Etc. keymappings
map('n', '-', ':Vexplore!<CR>')
map('n', 'Q', '@q')
map('n', '/', '/\v')
map('n', '?', '?\v')
map('n', 'H', 'gT')
map('n', 'L', 'gt')
map('n', '!', ':!')
map('n', 'q:', ':q')
map('n', 'Z',  'zA')
map('i', '<C-c>', '<ESC>')
map('i', 'jj', '<ESC>')
map('n', '<BS>', ':b#<CR>')

-- Terminal stuff
map('t', '<Esc>', '<C-\\><C-n>')
map('t', '<C-h>', '<C-\\><C-n><C-w>h')
map('t', '<C-j>', '<C-\\><C-n><C-w>j')
map('t', '<C-k>', '<C-\\><C-n><C-w>k')
map('t', '<C-l>', '<C-\\><C-n><C-w>l')
vim.cmd  [[au TermOpen * setlocal nonumber norelativenumber bufhidden=hide]]

vim.cmd [[ au! bufwritepost init.lua source % ]]


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
vim.o.smartcase = true
vim.o.wildignorecase = true
vim.o.timeoutlen = 500
vim.o.number = true
vim.o.mouse="a"
vim.o.hlsearch = false
vim.o.relativenumber = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
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
--
vim.cmd [[packadd packer.nvim]]
vim.cmd [[packloadall]]
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Cosmetic
  use 'mechatroner/rainbow_csv'
  use 'savq/melange'
  use  'nvim-lualine/lualine.nvim'
  require('lualine').setup({ 
    options = {
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' }
    }
  })

  -- Testing
  use 'vim-test/vim-test'
  vim.g["test#strategy"] = "dispatch"

  -- Python
  use 'psf/black'
  vim.cmd  [[autocmd BufWritePre *.py execute 'silent :Black']]
  use 'fisadev/vim-isort'
  vim.cmd  [[autocmd BufWritePre *.py execute 'silent :Isort']]

  -- LSP
  use { 'ms-jpq/coq_nvim', run = 'python3 -m coq deps'}
  use 'ms-jpq/coq.artifacts'
  use {'neovim/nvim-lspconfig', 
    config = function() 
	      local lsp = require'lspconfig'
	      local coq = require'coq'
	      lsp.pyright.setup(coq.lsp_ensure_capabilities())
	      lsp.bashls.setup(coq.lsp_ensure_capabilities({}))
	      lsp.dockerls.setup(coq.lsp_ensure_capabilities({}))
	      lsp.elixirls.setup(coq.lsp_ensure_capabilities({
	        cmd = {vim.fn.expand("~/.local/share/nvim/lsp_servers/elixir/elixir-ls/language_server.sh")}
	      }))
	      lsp.jsonls.setup(coq.lsp_ensure_capabilities({
	        cmd = {"vscode-json-languageserver", "--stdio"}
	      }))
	      lsp.sqlls.setup(coq.lsp_ensure_capabilities({}))
	      lsp.terraformls.setup(coq.lsp_ensure_capabilities({}))
	      lsp.tsserver.setup(coq.lsp_ensure_capabilities({}))
	      lsp.tailwindcss.setup(coq.lsp_ensure_capabilities({}))
    end
  }
  use 'williamboman/nvim-lsp-installer'
  use 'tamago324/nlsp-settings.nvim'
  -- Navigation
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {'kyazdani42/nvim-tree.lua', 
    config = function()
      require('nvim-tree').setup{ view = { side = 'right' }, git = { enable = false} }
    end
  }
  use 'ryanoasis/vim-devicons'
  use 'glepnir/dashboard-nvim'
  use 'nvim-lua/popup.nvim'
  use {'ggandor/lightspeed.nvim', 
    config = function() require('lightspeed').setup{ ignore_case = true } end
  }
  use {"folke/which-key.nvim",
    config = function()
      require("which-key").setup{}
    end
  }
  vim.g.dashboard_default_executive = 'telescope'
  vim.g.dashboard_custom_footer = {"Destroy things with neovim"}
  vim.g.dashboard_custom_header = {
    '     ⠀⠀⠀⠀⠀⠀⠀⡴⠞⠉⢉⣭⣿⣿⠿⣳⣤⠴⠖⠛⣛⣿⣿⡷⠖⣶⣤⡀⠀⠀⠀  ',
    '   ⠀⠀⠀⠀⠀⠀⠀⣼⠁⢀⣶⢻⡟⠿⠋⣴⠿⢻⣧⡴⠟⠋⠿⠛⠠⠾⢛⣵⣿⠀⠀⠀⠀  ',
    '   ⣼⣿⡿⢶⣄⠀⢀⡇⢀⡿⠁⠈⠀⠀⣀⣉⣀⠘⣿⠀⠀⣀⣀⠀⠀⠀⠛⡹⠋⠀⠀⠀⠀  ',
    '   ⣭⣤⡈⢑⣼⣻⣿⣧⡌⠁⠀⢀⣴⠟⠋⠉⠉⠛⣿⣴⠟⠋⠙⠻⣦⡰⣞⠁⢀⣤⣦⣤⠀  ',
    '   ⠀⠀⣰⢫⣾⠋⣽⠟⠑⠛⢠⡟⠁⠀⠀⠀⠀⠀⠈⢻⡄⠀⠀⠀⠘⣷⡈⠻⣍⠤⢤⣌⣀  ',
    '   ⢀⡞⣡⡌⠁⠀⠀⠀⠀⢀⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠸⣇⠀⢾⣷⢤⣬⣉  ',
    '   ⡞⣼⣿⣤⣄⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠸⣿⣇⠈⠻  ',
    '   ⢰⣿⡿⢹⠃⠀⣠⠤⠶⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠀⣿⠛⡄⠀  ',
    '   ⠈⠉⠁⠀⠀⠀⡟⡀⠀⠈⡗⠲⠶⠦⢤⣤⣤⣄⣀⣀⣸⣧⣤⣤⠤⠤⣿⣀⡀⠉⣼⡇⠀  ',
    '   ⣿⣴⣴⡆⠀⠀⠻⣄⠀⠀⠡⠀⠀⠀⠈⠛⠋⠀⠀⠀⡈⠀⠻⠟⠀⢀⠋⠉⠙⢷⡿⡇⠀  ',
    '   ⣻⡿⠏⠁⠀⠀⢠⡟⠀⠀⠀⠣⡀⠀⠀⠀⠀⠀⢀⣄⠀⠀⠀⠀⢀⠈⠀⢀⣀⡾⣴⠃⠀  ',
    '   ⢿⠛⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠈⠢⠄⣀⠠⠼⣁⠀⡱⠤⠤⠐⠁⠀⠀⣸⠋⢻⡟⠀⠀  ',
    '   ⠈⢧⣀⣤⣶⡄⠘⣆⠀⠀⠀⠀⠀⠀⠀⢀⣤⠖⠛⠻⣄⠀⠀⠀⢀⣠⡾⠋⢀⡞⠀⠀⠀  ',
    '   ⠀⠀⠻⣿⣿⡇⠀⠈⠓⢦⣤⣤⣤⡤⠞⠉⠀⠀⠀⠀⠈⠛⠒⠚⢩⡅⣠⡴⠋⠀⠀⠀⠀  ',
    '   ⠀⠀⠀⠈⠻⢧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣻⠿⠋⠀⠀⠀⠀⠀⠀  ',
    '   ⠀⠀⠀⠀⠀⠀⠉⠓⠶⣤⣄⣀⡀⠀⠀⠀⠀⠀⢀⣀⣠⡴⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀  '
  }


  -- Utility
  use {'windwp/nvim-autopairs', 
    config = function() require('nvim-autopairs').setup{} end,
  }
  use 'jpalardy/vim-slime'
  vim.g.slime_target = "neovim"
  -- Change this to use slime with ipython
  vim.g.slime_python_ipython = 0
  use 'tpope/vim-rsi' -- emacs readline bindings
  use 'tpope/vim-fugitive' -- git
  use 'tpope/vim-rhubarb' -- github
  use 'tpope/vim-abolish' -- substitution
  use 'tpope/vim-dadbod' -- databases
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'
  use 'tpope/vim-dispatch' -- used by other plugins
  use 'radenling/vim-dispatch-neovim' -- no one knows
  use 'tpope/vim-surround' -- ysiw 
  use 'tpope/vim-commentary' -- comments
  use 'tpope/vim-repeat' -- better .
  use 'tpope/vim-sensible' -- good defaults
  use 'sheerun/vim-polyglot' -- all languages
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  
  vim.g.AutoPairsMapCR = 0
  vim.cmd [[au! FileType fugitive nm <buffer> <TAB> =]]
  vim.cmd [[au! BufEnter *.heex setlocal ft=eelixir]]


  -- Web
  use 'stephenway/postcss.vim'
  use 'mattn/emmet-vim'
  vim.g.user_emmet_settings = {
    javascript = {extends = 'jsx'},
    javascriptreact = {extends = 'jsx'},
    typescriptreact = {extends = 'jsx'},
  }

  -- Etc
  use 'direnv/direnv.vim'
  use 'editorconfig/editorconfig-vim'
  use 'jamestthompson3/nvim-remote-containers'
  use {"folke/persistence.nvim", config = function() require('persistence').setup() end}
  vim.g.direnv_auto = 1
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
map('n', '<localleader>f', vim.lsp.buf.format)
map('n', '<localleader>r', vim.lsp.buf.rename)
map('n', '<localleader>a', vim.lsp.buf.code_action)
map('n', '<localleader>e', vim.diagnostic.open_float)

map('n', '<leader>/', ':Telescope live_grep <CR>')
map('n', '<leader>;', ':Telescope commands<CR>')
map('n', '<leader><CR>', ':')
map('n', '<leader><leader>', ':b#<CR>')
map('n', '<leader>a', ':te<CR>')
map('n', '<leader>b', ':Telescope buffers<CR>')
map('n', '<leader>c', ':Telescope treesitter<CR>')
map('n', '<leader>d', ':NvimTreeToggle<CR>')
map('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>')
map('n', '<leader>f', ':Telescope git_files<CR>')
map('n', '<leader>g', ':Git<CR>')
map('n', '<leader>h', ':Telescope help_tags<CR>')
map('n', '<leader>i', ':echom "UNUSED"<CR>')
map('n', '<leader>jd', ':e ~/Dropbox/notes/dashboard.md<CR>')
map('n', '<leader>jj', ':Telescope find_files search_dirs={"~/Dropbox/notes"}<CR>')
map('n', '<leader>js', ':e /tmp/scratch.md<CR>')
map('n', '<leader>jt', ':e ~/notes/todo.txt<CR>')
map('n', '<leader>k', ':q<CR>')
map('n', '<leader>ln', vim.diagnostic.goto_next)
map('n', '<leader>ll', vim.diagnostic.open_float)
map('n', '<leader>lp', vim.diagnostic.goto_prev)
map('n', '<leader>m', ':Telescope oldfiles<CR>')
map('n', '<leader>n', ':tabe<CR>')
-- map('n', '<leader>oo', ':e ~/Dropbox/org/refile.org')
map('n', '<leader>p', ':cw<CR>')
map('n', '<leader>q', ':qa<CR>')
map('n', '<leader>ra', ':%s/')
map('n', '<leader>rr', ':s/')
map('n', '<leader>sh', ':vsplit<CR>')
map('n', '<leader>sj', ':split<CR><C-W>j')
map('n', '<leader>sk', ':split<CR>')
map('n', '<leader>sl', ':vsplit<CR><C-W>l')
map('n', '<leader>tt', ':TestNearest<CR>')
map('n', '<leader>to', ':TestVisit<CR>')
map('n', '<leader>ts', ':UltestSummary!<CR>')
map('n', '<leader>u', ':echom "UNUSED"<CR>')
map('n', '<leader>va', ':e ~/dotfiles/.bash_aliases<CR>')
map('n', '<leader>vk', ':e ~/.config/kitty/kitty.conf<CR>')
map('n', '<leader>vl', ':e .nvim/init.lua<CR>')
map('n', '<leader>vv', ':e ~/.config/nvim/init.lua<CR>')
map('n', '<leader>vt', ':e ~/dotfiles/.tmux.conf<CR>')
map('n', '<leader>vu', ':e ~/dotfiles/init.lua<CR>')
map('n', '<leader>vz', ':e ~/dotfiles/.zshrc<CR>')
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>x', 'mzgggqG`z')
-- map('n', '<leader>y', ':LuaSnipEdit<CR>')
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
map('n', '-', ':NvimTreeFindFile<CR>')
map('n', 'Q', '@q')
map('n', '/', '/\\v')
map('n', '?', '?\\v')
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
if vim.fn.filereadable("./.nvim/init.lua") == 1 then
  dofile("./.nvim/init.lua")
end



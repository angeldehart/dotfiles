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
-- vim.o.nohlsearch = true
vim.o.relativenumber = true
-- vim.o.foldmethod = syntax
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

-- TODO: redo these bindings in lua
vim.cmd [[
  set background=dark
  colo melange
  filetype plugin indent on
  syntax enable

  " LSP bindings
  nmap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
  nmap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
  nmap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
  nmap <silent> <localleader>f <cmd>lua vim.lsp.buf.formatting()<CR>
  nmap <silent> <localleader>r <cmd>lua vim.lsp.buf.rename()<CR>
  nmap <silent> <localleader>a <cmd>lua vim.lsp.buf.code_action()<CR>
  nmap <silent> <localleader>e <cmd>lua vim.diagnostic.open_float()<CR>

  nn <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
  nn <silent> <localleader> :<c-u>WhichKey  ','<CR>
  " Leader stuff
  nn <leader>/ :Telescope live_grep<CR>
  nn <leader>; :Commands<CR>
  nn <leader><CR> :
  nn <leader><leader> :b#<CR>
  nn <leader>a :ZenMode<CR>
  nn <leader>b :Telescope lsp_document_symbols<CR>
  nn <leader>c :Telescope treesitter<CR>
  nn <leader>d :Vexplore! .<CR>
  nn <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
  nn <leader>f :Telescope git_files<CR>
  nn <leader>g :Git<CR>
  nn <leader>h :Telescope help_tags<CR>
  " "nn <leader>i :echom "UNUSED"<CR>
  nn <silent> <leader>jc :call CondenseLog()<CR>
  nn <silent> <leader>jl :call OpenLog()<CR>
  nn <silent> <leader>jj :Telescope find_files search_dirs={"~/notes"}<CR>
  nn <silent> <leader>js :e ~/notes/scratch.md<CR>
  nn <silent> <leader>jt :e ~/notes/todo.txt<CR>
  nn <leader>k :q<CR>
  nmap <leader>ln <cmd>lua vim.diagnostic.goto_next()<CR>
  nmap <leader>ll <cmd>lua vim.diagnostic.open_float()<CR>
  nmap <leader>lp <cmd>lua vim.diagnostic.goto_prev()<CR>
  nn <leader>m :Telescope oldfiles<CR>
  nn <leader>n :tabe<CR>
  nn <leader>o :echom "UNUSED"<CR>
  nn <leader>p :cw<CR>
  nn <leader>q :qa<CR>
  nn <leader>ra :%s/
  nn <leader>rr :s/
  nn <leader>sh :vsplit<CR>
  nn <leader>sj :split<CR><C-W>j
  nn <leader>sk :split<CR>
  nn <leader>sl :vsplit<CR><C-W>l
  nn <silent> <leader>t :ToggleTerm<CR>
  " nn <silent> <leader>u  :echom "UNUSED"<CR>
  nn <leader>va :e ~/dotfiles/.bash_aliases<CR>
  nn <leader>vk :e ~/.config/kitty/kitty.conf<CR>
  nn <leader>vl :e ./.lvimrc<CR>
  nn <leader>vv :e ~/.config/nvim/init.lua<CR>
  nn <leader>vt :e ~/dotfiles/.tmux.conf<CR>
  nn <leader>vu :e ~/dotfiles/init.lua<CR>
  nn <leader>vz :e ~/dotfiles/.zshrc<CR>
  nn <leader>w :w<CR>
  nn <leader>x mzgggqG`z
  nn <leader>y :LuaSnipEdit<CR>
  function! ToggleFold() abort
    if &foldlevel < 99
      set foldlevel=99
    else
      setlocal foldlevel=1
    endif
  endfunction
  nn <leader>z :call ToggleFold()<cr>

  " Window navigation
  nn <C-j> <C-W>j
  nn <C-k> <C-W>k
  nn <C-h> <C-W>h
  nn <C-l> <C-W>l


  " Arrows resize
  nn <Left> :vertical res -5<CR>
  nn <Right> :vertical res +5<CR>
  nn <Up> :res +5<CR>
  nn <Down> :res -5<CR>

  " Etc. keymappings
  nn - :Vexplore!<CR>
  nn Q @q
  nn / /\v
  nn ? ?\v
  nn H gT
  nn L gt
  nn ! :!
  nn q: :q
  nn Z zA
  im <C-c> <ESC>
  im jj    <ESC>
  nn <BS> :b#<CR>

  " Terminal stuff
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  au TermOpen * setlocal nonumber norelativenumber bufhidden=hide

  au! bufwritepost init.lua source %
]]


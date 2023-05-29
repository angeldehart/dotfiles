---@diagnostic disable: undefined-global, redundant-parameter
-- ANGEL CAMPBELL'S WONDERFUL HORRIBLE VIM CONFIG

-- > YOU ARE LOVED
-- > YOU ARE WORTHY OF THAT LOVE
-- > YOU ARE NOT IN TROUBLE
-- > DRINK WATER


-- XXX SETTINGS
vim.g.maplocalleader = ","
vim.g.qf_join_changes = true -- for editing quickfix
vim.o.hlsearch = false
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.o.autochdir = false
vim.o.clipboard = "unnamedplus"
vim.o.relativenumber = true
vim.o.foldmethod = "expr"
vim.o.foldlevel = 99
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.g.netrw_banner = 0
vim.g["UltiSnipsSnippetDirectories"] = { "~/dotfiles/snippets" }
vim.o.background = "dark"
vim.cmd([[colo habamax]])
-- vim.diagnostic.config({
-- 	virtual_text = false,
-- 	signs = true,
-- 	float = { border = "single" },
-- })

--------------------------------------------------------------------------------

-- XXX KEYMAPPINGS
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- windows
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")
--
--tabs
vim.keymap.set("n", "H", "gT")
vim.keymap.set("n", "L", "gt")

-- resize
vim.keymap.set("n", "<Left>", ":vertical res -5<CR>")
vim.keymap.set("n", "<Right>", ":vertical res +5<CR>")
vim.keymap.set("n", "<Up>", ":res +5<CR>")
vim.keymap.set("n", "<Down>", ":res -5<CR>")

-- terminal
vim.keymap.set("t", "<C-/>", "<C-\\><C-n>")
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
vim.keymap.set("i", "<C-c>", "<ESC>")      -- C-c actually ESC
vim.keymap.set("i", "jj", "<ESC>")         -- jj in insert to ESC
vim.keymap.set("n", "!", ":!")             -- Shell commands
vim.keymap.set("n", "-", ":25Lex %:h<CR>") -- Cwd explorer
vim.keymap.set("n", "/", "/\\v")           -- Magic search
vim.keymap.set("n", "<BS>", ":b#<CR>")     -- Backspace jumps buffers
vim.keymap.set("n", "?", "?\\v")           -- Magic backwards search
vim.keymap.set("n", "Q", "@q")             -- One button macros
vim.keymap.set("n", "q:", ":q")            -- No q:

-- leader mappings
vim.keymap.set("n", "<leader>/", ":FzfLua live_grep<CR>")
vim.keymap.set("n", "<leader>;", ":FzfLua commands<CR>")
vim.keymap.set("n", "<leader><CR>", ":")
vim.keymap.set("n", "<leader><leader>", ":")
vim.keymap.set("n", "<leader>a", ":te<CR>")
vim.keymap.set("n", "<leader>b", ":FzfLua buffers<CR>")
vim.keymap.set("n", "<leader>c", ":FzfLua lsp_live_workspace_symbols<CR>")
vim.keymap.set("n", "<leader>d", ":25Lex<CR>")
vim.keymap.set("n", "<leader>e", ':e <C-R>=expand("%:p:h")<CR>/<C-n>')
vim.keymap.set("n", "<leader>f", ":FzfLua git_files<CR>")
vim.keymap.set("n", "<leader>gd", ":Git diff origin/main...HEAD %<CR>")
vim.keymap.set("n", "<leader>gg", ":Git<CR>")
vim.keymap.set("n", "<leader>h", ":FzfLua help_tags<CR>")
vim.keymap.set("n", "<leader>i", ":echom unused<CR>")
vim.keymap.set("n", '<leader>jf', ':lua require("fzf-lua").files({ cwd="~/notes" })<CR>')
vim.keymap.set("n", '<leader>jj', ':e ~/notes/journal.md<CR>')
vim.keymap.set("n", '<leader>jr', ':e ~/notes/read-watch-listen.md<CR>')
vim.keymap.set("n", '<leader>js', ':e ~/notes/shopping.md<CR>')
vim.keymap.set("n", '<leader>jt', ':e ~/notes/todo.md<CR>')
vim.keymap.set("n", "<leader>k", ":q<CR>")
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ll", vim.diagnostic.setqflist)
vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>m", ":FzfLua oldfiles<CR>")
vim.keymap.set("n", "<leader>n", ":tabe<CR>")
vim.keymap.set("n", "<leader>o", ":FzfLua grep_curbuf<CR>")
vim.keymap.set("n", "<leader>p", ":cw<CR>")
vim.keymap.set("n", "<leader>q", ":qa<CR>")
vim.keymap.set("n", "<leader>r", ":%s/")
vim.keymap.set("n", "<leader>sh", ":vsplit<CR>")
vim.keymap.set("n", "<leader>sj", ":split<CR><C-w>j")
vim.keymap.set("n", "<leader>sk", ":split<CR>")
vim.keymap.set("n", "<leader>sl", ":vsplit<CR><C-w>l")
vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>")
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>")
vim.keymap.set("n", "<leader>ti", ":TestVisit<CR>")
vim.keymap.set("n", "<leader>va", ":e ~/dotfiles/.bash_aliases<CR>")
vim.keymap.set("n", "<leader>vd", ":e ~/local-init.lua<CR>")
vim.keymap.set("n", "<leader>vk", ":e ~/.config/kitty/kitty.conf<CR>")
vim.keymap.set("n", "<leader>vv", ":e ~/dotfiles/init.lua<CR>")
vim.keymap.set("n", "<leader>vl", ":e ./.nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>vv", ":e ~/dotfiles/init.lua<CR>")
vim.keymap.set("n", "<leader>vz", ":e ~/dotfiles/.zshrc<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>x", ':UltiSnipsEdit')
vim.keymap.set("n", "<leader>y", ':let @+ = expand("%")<cr>')
vim.keymap.set("n", "<leader>z", function()
  if vim.wo.foldlevel > 0 then
    vim.wo.foldlevel = 0
  else
    vim.wo.foldlevel = 99
  end
end)


--------------------------------------------------------------------------------

-- XXX PACKAGES
vim.cmd([[packadd packer.nvim]])
vim.cmd([[packadd cfilter]])
require("packer").startup(function()
  use { "wbthomason/packer.nvim" }

  -- Autocomplete
  use { "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "quangnguyen30192/cmp-nvim-ultisnips"
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = cmp.config.sources({
          { name = "ultisnips" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
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
    end
  }

  -- LSP
  use { "neovim/nvim-lspconfig",
    requires = {
      "ray-x/lsp_signature.nvim",
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
      "jose-elias-alvarez/typescript.nvim",
      "jose-elias-alvarez/null-ls.nvim"
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "bright_script",
          "dockerls",
          "cssls",
          "emmet_ls",
          "eslint",
          "jsonls",
          "rust_analyzer",
          "lua_ls",
          "terraformls",
          "tsserver"
        }
      })
      require("typescript").setup({
        disable_commands = true,
        go_to_source_definition = {
          fallback = true,
        },
      })

      local lsp = require("lspconfig")
      lsp["bashls"].setup({})
      lsp["bright_script"].setup({})
      lsp["dockerls"].setup({})
      lsp["cssls"].setup({})
      lsp["elixirls"].setup({})
      lsp["eslint"].setup({})
      lsp["jsonls"].setup({})
      lsp["rust_analyzer"].setup({})
      lsp["lua_ls"].setup({})
      lsp["terraformls"].setup({})
      lsp["tflint"].setup({})
      lsp["tsserver"].setup({})
      require("null-ls").setup({
        sources = {
          require("typescript.extensions.null-ls.code-actions"),
        },
      })
    end
  }


  -- Cosmetic
  use { "nvim-lualine/lualine.nvim", config = function() require("lualine").setup() end }
  use { "ellisonleao/gruvbox.nvim" }

  -- Testing
  use { "vim-test/vim-test" }
  vim.g["test#strategy"] = "neovim"

  -- Snippets
  use { "SirVer/ultisnips" }

  -- Navigation
  use { "ryanoasis/vim-devicons" }
  use { 'ibhagwan/fzf-lua', requires = { 'nvim-tree/nvim-web-devicons' } }
  use { "stefandtw/quickfix-reflector.vim" }
  use { "ggandor/lightspeed.nvim", config = function() require("lightspeed").setup({ ignore_case = true }) end }

  -- Utility
  use { "nvim-lua/plenary.nvim" } -- async lib for plugins
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup({}) end }
  vim.g.AutoPairsMapCR = 0
  use { "tpope/vim-rsi" }                        -- emacs readline bindings
  use { "tpope/vim-fugitive" }                   -- git
  use { "tpope/vim-rhubarb" }                    -- github
  use { "tpope/vim-abolish" }                    -- substitution
  use { "tpope/vim-vinegar" }                    -- netrw improvements
  use { "tpope/vim-dadbod" }                     -- databases
  use { "kristijanhusak/vim-dadbod-ui" }         -- database UI
  use { "kristijanhusak/vim-dadbod-completion" } -- database completion
  use { "tpope/vim-dispatch" }                   -- used by other plugins
  use { "radenling/vim-dispatch-neovim" }        -- no one knows
  use { "tpope/vim-surround" }                   -- ysiw
  use { "tpope/vim-commentary" }                 -- comments
  use { "tpope/vim-repeat" }                     -- better .
  use { "tpope/vim-sensible" }                   -- good defaults
  use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }
  use { "editorconfig/editorconfig-vim" }
  use { "mracos/mermaid.vim" }
  use { "mattn/emmet-vim" }
  use { "elixir-editors/vim-elixir" }
end)

vim.cmd([[filetype plugin indent on]])
vim.cmd([[syntax enable]])

--------------------------------------------------------------------------------

-- XXX AUTOCOMMANDS
vim.cmd [[au! FileType fugitive nm <buffer> <TAB> =]]
vim.cmd [[au! FileType netrw nm <buffer> <C-l> <C-w>l]]
vim.cmd [[au! BufEnter *.heex setlocal ft=eelixir]]
vim.cmd [[au! BufEnter *.mdx setlocal ft=markdown]]
vim.cmd [[au! TermOpen * setlocal nonumber norelativenumber bufhidden=hide]]
vim.cmd [[au! FileType typescript,typescriptreact setlocal foldmethod=indent]]
vim.cmd [[au! FileType typescript,typescriptreact nn <localleader>i :lua require("typescript").actions.addMissingImports()<CR>]]
vim.cmd [[au! FileType typescript,typescriptreact nn <localleader>u :lua require("typescript").actions.removeUnused()<CR>]]
vim.cmd [[au! FileType typescript,typescriptreact nn <localleader>x :lua require("typescript").actions.fixAll()<CR>]]
vim.cmd [[au! BufEnter journal.md nn <C-n> <C-x>k ]]
vim.cmd [[au! BufEnter journal.md lua require('cmp').setup.buffer { enabled = false }]]
vim.cmd [[au! BufWritePre *.json,*.lua,*.tf lua vim.lsp.buf.format()]]
vim.cmd [[au! BufWritePre *.ts,*.tsx,*.js,*.jsx EslintFixAll]]
vim.cmd [[au! FileType snippets setlocal foldmethod=indent]]
--------------------------------------------------------------------------------

-- XXX CONFIGS
vim.cmd([[ au! bufwritepost init.lua source % ]]) -- Autoload
-- Project config
if vim.fn.filereadable("./.nvim/init.lua") == 1 then
  dofile("./.nvim/init.lua")
end
-- Device config
-- if vim.fn.filereadable(os.getenv("home") .. "local-init.lua") == 1 then
--   dofile(os.getenv("home") .. "local-init.lua")
-- end

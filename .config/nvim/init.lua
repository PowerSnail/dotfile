-- | PACKER | --
local packer = require 'packer'

packer.startup(function(use)
  -- The Packager manager herself. Needs to be here.
  use 'wbthomason/packer.nvim'

  -- PaperColor theme
  use 'NLKNguyen/papercolor-theme'
  use 'rmehri01/onenord.nvim'
  use 'preservim/vim-colors-pencil'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Auto complete
  use 'ms-jpq/coq_nvim'
  use 'ms-jpq/coq.artifacts'
  use 'ms-jpq/coq.thirdparty'

  -- File pane
  use 'ms-jpq/chadtree'

  -- Fuzzy search
  use 'junegunn/fzf'

  -- For prose writing
  use 'preservim/vim-pencil'
  use 'junegunn/goyo.vim'

  -- Status line
  use 'SmiteshP/nvim-navic'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Git
  use 'tpope/vim-fugitive'
end
)

-- Show line number
vim.opt.number = true

-- Highlight the line where the cursor is at
vim.opt.cursorline = true

-- Use space instead of tab
vim.opt.expandtab = true

-- Default tab size set to 2
vim.opt.shiftwidth = 2

-- Theme
vim.opt.background = 'light'
require('onenord').setup()

-- Status line
require('lualine').setup {}
vim.opt.laststatus = 3

-- No wrap line
vim.opt.wrap = false

-- Performance
vim.o.lazyredraw = true
vim.o.ttyfast = true

-- Autoread
vim.o.autoread = true

-- Treesitter Settings
local configs = require 'nvim-treesitter.configs'
configs.setup {
  highlight = {
    enable = true,
  }
}

-- LSP & Autocompletion
local lsp = require 'lspconfig'
local coq = require 'coq'
local opts = { noremap = true, silent = true }
local navic = require 'nvim-navic'
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  navic.attach(client, bufnr)
end
vim.cmd("COQnow --shut-up")

-- Neovim's python env
vim.g.python3_host_prog = "/usr/bin/python3"

-- Python
lsp.pyright.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
})

-- Lua
lsp.sumneko_lua.setup(
  coq.lsp_ensure_capabilities {
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        format = {
          enable = true,
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
          }
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  }
)

-- CHADTree
vim.keymap.set('n', '<leader>v', '<cmd>CHADopen<cr>')

-- Pencil for Markdown
local proseGroup = vim.api.nvim_create_augroup("PencilInit", {})
vim.api.nvim_create_autocmd(
  { "BufEnter", "BufWinEnter" },
  {
    pattern = { "*.markdown", "*.md" },
    group = proseGroup,
    callback = function()
      vim.call("pencil#init")
      vim.keymap.set("n", "<space>g", "<cmd>Goyo<cr>")
    end
  }
)

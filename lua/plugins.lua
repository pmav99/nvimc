-- Modeline and notes {
-- vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
-- }


return require("packer").startup(function()
  local use = use

  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use "lewis6991/impatient.nvim"

  -----------------------------
  -- Style plugins
  -----------------------------

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate',
    config = function()
      require('treesitter-config')
    end
  }

  -----------------------------
  -- Behavior plugins
  -----------------------------
  use {
    -- This is similar to vim-surround
    'steelsojka/pears.nvim',
    config = function()
      require('pears-config')
    end
  }
  -- Set relative line numbers when in focus.
  use {
    'jeffkreeftmeijer/vim-numbertoggle'
  }
  -----------------------------
  -- Fuzzy finding plugins
  -----------------------------
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    keys = {'<Space>'},
    config = function()
      require('telescope-config')
    end
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  -----------------------------
  -- Development plugins
  -----------------------------

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('lsp-config')
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp'},
    config = function()
      require('cmp-config')
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns-config')
    end
  }

  -- Edit
  --use("tpope/vim-surround")
  --use("Raimondi/delimitMate")

  -- Colorscheme
  use("bluz71/vim-nightfly-guicolors")
  use("bluz71/vim-moonfly-statusline")

  -- LSP
  --use("neovim/nvim-lspconfig")
  -- use("nvim-lua/completion-nvim")
  --use {
    --"hrsh7th/nvim-cmp",
    --requires = {
      --"hrsh7th/vim-vsnip",
      --"hrsh7th/cmp-buffer",
    --}
  --}


  --use {
    --'lukas-reineke/indent-blankline.nvim',
    --event = 'BufRead',
    --config = function()
      --require('indent-blankline-config')
    --end
  --}

  -- Workaround for Neovim bug, see:
  --   https://github.com/neovim/neovim/issues/12587
  use 'antoinemadec/FixCursorHold.nvim'

end)

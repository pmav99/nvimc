-- Modeline and notes {
-- vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
-- }

-- { local aliases
  local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
  local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
  local g = vim.g      -- a table to access global variables
  local o = vim.opt    -- to set options
  local bo = vim.bo    -- to set buffer options
  local wo = vim.wo    -- to set window options

  local map = vim.api.nvim_set_keymap
-- } local aliases

-- { Packer
  -- bootstrap
  local packer_install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(packer_install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_install_path})
    vim.cmd 'packadd packer.nvim'
  end

  -- Speed up loading of Lua modules. Note, this needs to happen BEFORE Lua plugins are loaded.


-- } Packer

g.mapleader = ','
g.maplocalleader = ','

require('plugins')

-- { Backup - Undo - Swap
  bo.swapfile = false
  o.backup = true
  o.undofile = true
  o.undodir = fn.stdpath('data') .. '/undodir'
-- } Backup - Undo - Swap

o.number = true
o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.showmode = false
o.hidden = true
o.completeopt='menuone,noinsert,noselect'
bo.autoindent = true
bo.smartindent = true


o.tabstop = 8
o.shiftwidth = 2
o.shiftround = true
bo.softtabstop = 2
bo.expandtab = true

wo.wrap = false    -- Disable wrapped lines
bo.textwidth = 108
g.colors_name = "nightfly"


-- highlight and searching {
  o.incsearch = true
  o.hlsearch = true
  o.ignorecase = true
  o.smartcase = true

  -- clear highlighted search
  map('n', '<Leader>/', ':set hlsearch!<CR>', { noremap = true, silent = true })

  -- keep search matches in the middle of the window.
  map('n', 'n', 'nzzzv', { noremap = true, silent = true })

-- highlight and searching }

-- Mappings
cmd('source ' .. vim.fn.stdpath('config') .. '/mappings.vim')

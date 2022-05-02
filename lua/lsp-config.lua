-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

require'lspconfig'.pyright.setup{}

local nvim_lsp = require('lspconfig')
local handlers = require('lsp-handlers')
local cmp_lsp = require('cmp_nvim_lsp')

vim.lsp.set_log_level 'trace'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<C-p>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- The nvim-cmp completion plugin supports most LSP capabilities; we should
-- notify the language servers about that.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.update_capabilities(capabilities)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
local servers = { 'pyright' }
for _, server_name in ipairs(servers) do
  nvim_lsp[server_name].setup {
    on_attach = on_attach,
    cmd = { 'pyright-langserver', '--stdio' },
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Diagnostics symbols for display in the sign column.
-- vim.cmd('sign define LspDiagnosticsSignError text=▶')
-- vim.cmd('sign define LspDiagnosticsSignWarning text=▶')
-- vim.cmd('sign define LspDiagnosticsSignInformation text=▶')
-- vim.cmd('sign define LspDiagnosticsSignHint text=▶')


  -- Mappings.
  --   map(0, 'n', 'ga','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --   map(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --   map(0, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --   map(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --   map(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --   map(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --   map(0, 'n', 'gR','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --   map(0, 'i', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --   map(0, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({severity_limit = "Warning", popup_opts = {border = "single"}})<CR>', opts)
  --   map(0, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({severity_limit = "Warning", popup_opts = {border = "single"}})<CR>', opts)
  --   map(0, 'n', "'d", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border = "single"})<CR>', opts)

-- Global handlers.
vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.diagnostics
vim.lsp.handlers['textDocument/hover'] = handlers.hover
vim.lsp.handlers['textDocument/signatureHelp'] = handlers.signature_help

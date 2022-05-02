local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  ensure_installed = {
    'bash', 'c', 'cpp', 'go', 'html', 'java', 'javascript', 'lua',
    'python', 'ruby', 'typescript', 'vue'
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { 'dart' }
  }
})

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "rust",
    "svelte",
    "toml",
    "typescript",
    "vim",
    "yaml"
  },
  sync_install = false,
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than 1000 lines, int
  }
}

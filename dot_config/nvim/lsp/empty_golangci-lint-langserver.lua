return {
	cmd = { "golangci-lint-langserver" },
  cmd_env = { GOLANGCI_LINT_CACHE = vim.env.XDG_CACHE_HOME .. "/golangci-lint" },
  init_options = {
    command = function()
      if vim.fn.filereadable(vim.env.XDG_CONFIG_HOME .. "/golangci-lint/golangci.yml") == 1 then
        return {
          "golangci-lint",
          "run",
          "--fix=false",
          "--out-format",
          "json",
          "--config",
          vim.env.XDG_CONFIG_HOME .. "/golangci-lint/golangci.yml",
        }
      end
      return { "golangci-lint", "run", "--fix=false", "--out-format", "json" }
    end,
  }
	filetypes = { "go", "gomod" },
}

local lspinstall = require('lspinstall')

local function setup_servers()
  lspinstall.setup()
  local servers = lspinstall.installed_servers()
  for _, server in pairs(servers) do
    require('lspconfig')[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
lspinstall.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
end

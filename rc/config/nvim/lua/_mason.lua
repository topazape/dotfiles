local mason = require('mason')
mason.setup({})

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup({})
mason_lspconfig.setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup({})
  end
})

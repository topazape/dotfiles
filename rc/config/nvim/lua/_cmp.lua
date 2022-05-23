local cmp = require('cmp')
local symbol_map = {
  Text          = '',
  Method        = '',
  Function      = '',
  Constructor   = '',
  Field         = '',
  Variable      = '',
  Class         = '',
  Interface     = 'ﰮ',
  Module        = '',
  Property      = '',
  Unit          = '',
  Value         = '',
  Enum          = '',
  Keyword       = '',
  Snippet       = '﬌',
  Color         = '',
  File          = '',
  Reference     = '',
  Folder        = '',
  EnumMember    = '',
  Constant      = '',
  Struct        = '',
  Event         = '',
  Operator      = 'ﬦ',
  TypeParameter = '',
}

cmp.setup({
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = symbol_map[vim_item.kind] .. ' ' .. vim_item.kind
      -- set a name for each source
      vim_item.menu = ({
        buffer      = '[Buffer]',
        nvim_lsp    = '[LSP]',
        ultisnips   = '[UltiSnips]',
        nvim_lua    = '[Lua]',
        cmp_tabnine = '[TabNine]',
        look        = '[Look]',
        path        = '[Path]',
        spell       = '[Spell]',
        calc        = '[Calc]',
        emoji       = '[Emoji]'
      })[entry.source.name]
      return vim_item
    end,
  },

  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    -- Accept currently selected item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
  },

  completion = { completeopt = 'menu,menuone,noinsert' },
})

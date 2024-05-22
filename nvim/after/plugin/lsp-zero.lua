-- https://lsp-zero.netlify.app/v3.x/getting-started.html
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp_zero.preset("recommended")
-- here you can setup the language servers

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
  end,

  lua_ls = function()
      require('lspconfig').lua_ls.setup {
          capabilities = vim.tbl_deep_extend(
              "force",
              {},
              vim.lsp.protocol.make_client_capabilities(),
              require("cmp_nvim_lsp").default_capabilities()
          ),
          settings = {
                Lua = {
                    runtime = { version = "Lua 5.1" },
                    diagnostics = {
                        globals = { "vim", "it", "describe", "before_each", "after_each" },
                    }
                }
            }
        }
    end,
  },
})


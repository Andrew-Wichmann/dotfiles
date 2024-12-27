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
    ensure_installed = {"pyright"},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }

})

require('lspconfig').lua_ls.setup({
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true)
       -- library = {
       --   vim.env.VIMRUNTIME
       --   -- Depending on the usage, you might want to add additional paths here.
       --   -- "${3rd}/luv/library"
       --   -- "${3rd}/busted/library",
       -- }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

require('lspconfig').ts_ls.setup({})

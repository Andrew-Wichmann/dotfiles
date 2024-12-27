vim.keymap.set("n", "<leader>cp",
    function()
      local input = vim.fn.input("Quick Chat: ")
      if input ~= "" then
        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
      end
    end, {}
)
vim.keymap.set("n", "<leader>cpo",
    function()
      require("CopilotChat").open()
    end, {}
)
package.loaded["CopilotChat"] = nil
require("CopilotChat").setup({
    mappings = {
    close = {
          normal = 'q',
          insert = '',
        },
    }
})

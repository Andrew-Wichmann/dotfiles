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
vim.keymap.set("n", "<leader>cpd", ":Copilot disable<CR>")
vim.keymap.set("n", "<leader>cpe", ":Copilot enable<CR>")
require("CopilotChat").setup({
    mappings = {
    close = {
          normal = 'q',
          insert = '',
        },
    },
    model= 'o1'
})
vim.cmd("Copilot disable")

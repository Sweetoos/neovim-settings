local builtin = require('telescope.builtin')
local lspconfig=require("lspconfig")

vim.keymap.set("n", "<leader>s", "<cmd>wall<CR>", { desc = "Save all files" })
vim.keymap.set('n', '<leader>re', function() vim.cmd("Explore") end)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>rf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ra', builtin.live_grep, {})
vim.keymap.set('n', '<leader>rs', function() 
    builtin.grep_string({search = vim.fn.input("Grep > ")})
end)

vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float, { desc = "Show diagnostics at cursor" })

vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
vim.keymap.set({'n'}, '<leader>ca', vim.lsp.buf.code_action, {})

local harpoon=require("harpoon")
local mark=require("harpoon.mark")
local ui=require("harpoon.ui")

vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end)
vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end)
vim.keymap.set("n", "<C-h>", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() require("harpoon.ui").nav_file(4) end)

vim.keymap.set("n", "<leader>rw", function()
  local word = vim.fn.input("Replace with: ")
  vim.cmd("%s/\\<\\w\\+\\>/" .. word .. "/g")
end)

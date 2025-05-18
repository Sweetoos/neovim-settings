return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x", -- Assuming you want the 3.x branch
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false, -- Show hidden files
          hide_gitignored = true,
          exclude = { "markdown" }, -- Exclude specific files/dirs
        },
      },
      -- Add other neo-tree configuration options here as needed
    })

    -- Keymaps
    vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
    vim.keymap.set('n', '<C-,>', function()
      local current_buf = vim.api.nvim_get_current_buf()
      local buf_ft = vim.api.nvim_buf_get_option(current_buf, 'filetype')
      if buf_ft == 'neo-tree' then
        vim.cmd('wincmd l')
      else
        vim.cmd('wincmd h')
      end
    end, { desc = 'Toggle focus Neo-tree/file' })

    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  end,
}

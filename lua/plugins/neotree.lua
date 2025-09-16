return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
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
    -- Ctrl+n: If Neo-tree is closed -> open and focus it.
    --         If Neo-tree is open and focused -> go back to last non-neo-tree window.
    --         If Neo-tree is open but not focused -> focus Neo-tree window.
    vim.keymap.set('n', '<C-n>', function()
      local neo_tree_wins = {}
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local ft = vim.api.nvim_get_option_value('filetype', { buf = buf })
        if ft == 'neo-tree' then
          table.insert(neo_tree_wins, win)
        end
      end

      local current_buf = vim.api.nvim_get_current_buf()
      local current_ft = vim.api.nvim_get_option_value('filetype', { buf = current_buf })

      if #neo_tree_wins == 0 then
        vim.cmd('Neotree reveal')
        return
      end

      if current_ft == 'neo-tree' then
        -- Switch back to previous window (most intuitive cross-platform)
        vim.cmd('wincmd p')
        return
      end

      -- Focus first neo-tree window found
      vim.api.nvim_set_current_win(neo_tree_wins[1])
    end, { desc = 'Toggle open/focus Neo-tree' })

    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  end,
}

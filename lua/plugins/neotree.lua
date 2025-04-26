return{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>') 
        vim.keymap.set('n', '<C-,>', function()
            local current_buf = vim.api.nvim_get_current_buf()
            local buf_ft = vim.api.nvim_buf_get_option(current_buf, 'filetype')
            if buf_ft == 'neo-tree' then
                vim.cmd('wincmd l')
            else
                vim.cmd('wincmd h')
            end
        end, { desc = 'Toggle focus between Neo-tree and file' })

        vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    end
}

return {
    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.5',
        lazy = false,
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        lazy = false,
        config = function()
            require("telescope").setup({
                extensions={
                    ["ui-select"]={
                        require("telescope.themes").get_dropdown{
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select") 
        end
    },
}

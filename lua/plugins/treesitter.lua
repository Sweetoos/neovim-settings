return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = {
                    "lua",
                    "cmake",
                    "javascript",
                    "cpp",
                    "c",
                    "html",
                    "css",
                    "java",
                    "python",
                    "rust",
                    "cmake",
                    "make",
                    "typescript",
                    "tsx"
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    }
}

return {
    {
        "nvimtools/none-ls.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    -- FORMATTERS
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.black, -- for Python
                    null_ls.builtins.formatting.isort, -- for Python
                    null_ls.builtins.formatting.clang_format.with({
                        filetypes = { "c", "cpp", "objc", "objcpp" },
                    }),
                },
            })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "black",
                    "isort",
                    "prettier",
                    "stylua",
                    "clang-format",
                },
                automatic_installation = true,
                handlers = {},
            })
        end,
    },
}

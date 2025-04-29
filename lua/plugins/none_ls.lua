return {
    "nvimtools/none-ls.nvim",
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
                    "c","cpp","objc","objcpp",
                }),
                -- LINTERS
                null_ls.builtins.diagnostics.eslint_d,
            },
        })
    end,
}

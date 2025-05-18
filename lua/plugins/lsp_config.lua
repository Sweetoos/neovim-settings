return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "clangd", "ast_grep", "pyright" },
            })
        end,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.ts_ls.setup({
                server = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                },
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = false
                end,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--log=verbose",
                    "--pretty",
                    "--header-insertion=never",
                    "--clang-tidy",
                },
                init_options = {
                    CompileCommands = {
                        search_dir = "",
                        use_cxx_flags = true,
                    },
                    ClangCommandLine = {
                        "-I/usr/local/include", -- **Add your OpenSSL include path here!**
                        "-std=c++2b", -- Add other necessary flags
                        "-Wall",
                        "-Wextra",
                    },
                },
            })
            lspconfig.ast_grep.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
        end,
    },
}

return {
    {
        "williamboman/mason.nvim",
        version = "^1.0.0",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        version = "^1.0.0",
        dependencies={"williamboman/mason.nvim"},
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { 
                    "lua_ls", 
                    "ts_ls", 
                    "clangd", 
                    "ast_grep", 
                    "pyright",
                    "html",
                    "cssls",
                    "eslint",
                    "tailwindcss"
                },
            })
        end,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies={"williamboman/mason.nvim"},
        lazy = false,
        config = function()
            -- Define on_attach function
            local on_attach = function(client, bufnr)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
            end

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            
            -- TypeScript/JavaScript
            vim.lsp.config('ts_ls', {
                capabilities = capabilities,
                on_attach = on_attach,
            })
            vim.lsp.enable('ts_ls')
            
            -- Lua
            vim.lsp.config('lua_ls', {
                capabilities = capabilities,
                on_attach = on_attach,
            })
            vim.lsp.enable('lua_ls')
            
            -- C/C++
            vim.lsp.config('clangd', {
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    on_attach(client, bufnr)
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
                        "-I/usr/local/include",
                        "-std=c++2b",
                        "-Wall",
                        "-Wextra",
                    },
                },
            })
            vim.lsp.enable('clangd')
            
            -- AST Grep
            vim.lsp.config('ast_grep', {
                capabilities = capabilities,
                on_attach = on_attach,
            })
            vim.lsp.enable('ast_grep')
            
            -- Python
            vim.lsp.config('pyright', {
                capabilities = capabilities,
                on_attach = on_attach,
            })
            vim.lsp.enable('pyright')
            
            -- HTML
            vim.lsp.config('html', {
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "html", "htm" },
            })
            vim.lsp.enable('html')
            
            -- CSS
            vim.lsp.config('cssls', {
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "css", "scss", "less" },
            })
            vim.lsp.enable('cssls')
            
            -- ESLint
            vim.lsp.config('eslint', {
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
            })
            vim.lsp.enable('eslint')
            
            -- Tailwind CSS
            vim.lsp.config('tailwindcss', {
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
            })
            vim.lsp.enable('tailwindcss')
        end,
    },
}

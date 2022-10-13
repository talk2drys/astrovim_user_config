return {
    ["williamboman/mason-lspconfig.nvim"] = {
        ensure_installed = { "rust_analyzer", "dartls" }, -- install rust_analyzer
    },

    -- Dart Enhancement for Flutter Development
    ["akinsho/flutter-tools.nvim"] = {
        -- requires = { "nvim-dap", "plenary.nvim" },
        after = "mason-lspconfig.nvim",
        requires = { "plenary.nvim" },
        config = function()
            require("flutter-tools").setup(require "user.plugins.flutter-tools")
        end,
    },

    -- Rust Tools
    ["simrat39/rust-tools.nvim"] = {
        after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
        config = function()
            --  require("rust-tools").setup(require "user.plugins.rust-tools")
            require("rust-tools").setup {
                server = astronvim.lsp.server_settings "rust_analyzer",
            }
        end,
    },
}
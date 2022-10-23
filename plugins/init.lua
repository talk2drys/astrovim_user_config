return {
    ["williamboman/mason-lspconfig.nvim"] = {
        ensure_installed = {},
    },

    -- Dart Enhancement for Flutter Development
    ["akinsho/flutter-tools.nvim"] = {
        -- requires = { "nvim-dap", "plenary.nvim" },
        after = {"mason-lspconfig.nvim"},
        requires = { "plenary.nvim", "telescope.nvim", "nvim-dap.nvim" },
        config = function()
            require("flutter-tools").setup(require "user.plugins.flutter-tools")
        end,
    },

    -- Rust Tools
    ["simrat39/rust-tools.nvim"] = {
        after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
        config = function()
            require("rust-tools").setup(require "user.plugins.rust-tools")
        end,
    },

    -- Rust Tools Create.io support
    ["saecki/crates.nvim"] = {
        tag = 'v0.3.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    },


    -- Nvim Dap
    ["mfussenegger/nvim-dap"] = {
        config = require "user.plugins.nvim-dap"
    },

    -- Nvim Dap Ui
    ["rcarriga/nvim-dap-ui"] = {
        after = "nvim-dap",
        config = require "user.plugins.nvim-dapui",
    },
}

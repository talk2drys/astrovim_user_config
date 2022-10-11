return {
    -- get the server settings and built in capabilities/on_attach
    server = astronvim.lsp.server_settings "rust_analyzer",
    tools = {
        -- executor = require("rust-tools/executors").termopen,
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
            max_len_align = true,
            max_len_align_padding = 1,
            right_align = true,
            right_align_padding = 7,
            highlight = "Comment",
        },
    }
}
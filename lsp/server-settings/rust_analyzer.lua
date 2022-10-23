return {
  settings = {
    -- to enable rust-analyzer settings visit:
    -- https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importEnforceGranularity = true,
      },
      cargo = {
        loadOutDirsFromCheck = true,
        allFeatures = true,
      },
      procMacro = {
        enable = true,
      },
      checkOnSave = {
        command = "clippy",
      },
      experimental = {
        procAttrMacros = true,
      },
      hoverActions = {
        references = true,
      },
      inlayHints = {
        chainingHints = true,
        maxLength = 40,
        parameterHints = true,
        typeHints = true,
        lifetimeElisionHints = {
          enable = true,
          useParameterNames = true
        }
      },
      lens = {
        methodReferences = true,
        references = true,
      },
    },
  },
}

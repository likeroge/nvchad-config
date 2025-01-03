local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local util = require "lspconfig/util"

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd", "gopls", "gradle_ls", "rust_analyzer", "prismals", "ts_ls" }

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {
      OrganizeImports = {
        organize_imports,
        description = "Organize Imports",
      },
    },
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  }
  lspconfig.prismals.setup {}
  lspconfig.ts_ls.setup {}

  -- lspconfig.rust_analyzer.setup {
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   root_dir = util.root_pattern "Cargo.toml",
  --   -- on_init = on_init,
  --   settings = {
  --     ["rust-analyzer"] = {
  --       cargo = {
  --         allFeatures = true,
  --       },
  --       checkOnSave = {
  --         command = "clippy",
  --       },
  --     },
  --   },
  -- }
end

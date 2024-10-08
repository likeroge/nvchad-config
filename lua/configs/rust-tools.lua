-- local on_attach = require("configs.lspconfig").on_attach

-- local capabilities = require("configs.lspconfig").capabilities

local configs = require "nvchad.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}

return options

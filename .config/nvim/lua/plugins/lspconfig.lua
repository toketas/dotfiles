return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "tailwindcss",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
-- return {
--   "neovim/nvim-lspconfig",
--   event = { "BufReadPre", "BufNewFile" },
--   dependencies = {
--     "hrsh7th/cmp-nvim-lsp",
--     { "antosha417/nvim-lsp-file-operations", config = true },
--   },
--   config = function()
--     local lspconfig = require("lspconfig")
--
--     local cmp_nvim_lsp = require("cmp_nvim_lsp")
--
--     local capabilities = cmp_nvim_lsp.default_capabilities()
--
--     local opts = { noremap = true, silent = true }
--
--     local on_attach = function (client, bufnr)
--       opts.buffer = bufnr
--     end
--
--     lspconfig["html"].setup({
--       capabilities = capabilities,
--       on_attach = on_attach,
--     })
--
--     lspconfig["tsserver"].setup({
--       capabilities = capabilities,
--       on_attach = on_attach,
--     })
--
--     lspconfig["tailwindcss"].setup({
--       capabilities = capabilities,
--       on_attach = on_attach,
--     })
--
--     lspconfig["lua_ls"].setup({
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = {
--         Lua = {
--           diagnostics = {
--             globals = { "vim" },
--           },
--           workspace = {
--             library = {
--               [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--               [vim.fn.stdpath("config") .. "/lua"] = true,
--             },
--           },
--         },
--       },
--     })
--   end,
-- }

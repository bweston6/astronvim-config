---@type LazySpec
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function() require("copilot").setup {} end,
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup {
        opts = {
          show_defaults = false,
        },
        adapters = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "gemini-2.5-pro-preview-06-05",
                },
              },
            })
          end,
          my_openai = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "http://windows.lan:1234",
              },
              schema = {
                model = {
                  default = "google/gemma-3-12b",
                  -- default = "qwen/qwen-3-14b",
                },
              },
            })
          end,
        },
      }
    end,
  },
}

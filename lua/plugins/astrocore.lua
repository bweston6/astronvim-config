-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["<C-a>"] = { "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
        ["<Leader>a"] = { "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion Chat" },
      },
      v = {
        ["<C-a>"] = { "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
        ["<Leader>a"] = { "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion Chat" },
        ["ga"] = { "<cmd>CodeCompanionChat Add<cr>", desc = "Add selection to CodeCompanion Chat" },
      },
      c = {
        ["cc"] = { "CodeCompanion", desc = "Expand 'cc' to 'CodeCompanion'" },
      },
    },
  },
}

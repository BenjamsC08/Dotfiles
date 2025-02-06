return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}

--   {
--    "Diogo-ss/42-header.nvim",
--    cmd = {"Stdheader"},
--    keys = { "<F3>"},
--    opt = {
--      default_map = false,
--      auto_update = true,
--      user = "benjamsc",
--      mail = "benjamsc@student.42.fr"
--    },
--    config = function(_,opts)
--      require("42header").setup(opts)
--    end,
--  },
--  {
--    "hardyrafael17/norminette42.nvim",
--    ft = {"c", "h"},
--    config = function()
--    local norminette = require("norminette")
--    norminette.setup({
--        runOnSave = true,
--        maxErrorsToShow = 2,
--        active = true,
--      })
--    end,
--  },

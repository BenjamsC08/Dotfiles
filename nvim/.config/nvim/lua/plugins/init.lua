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
	{
		"MoulatiMehdi/42norm.nvim",
		config = function()
			local norm = require("42norm")

			norm.setup({
				header_on_save = true,
				format_on_save = true,
				liner_on_change = true,
			})

			-- Press "F5" key to run the norminette
			vim.keymap.set("n", "<F5>", function()
				norm.check_norms()
			end, { desc = "Update 42norms diagnostics", noremap = true, silent = true })

			vim.keymap.set("n", "<C-f>", function()
				norm.format()
			end, { desc = "Format buffer on 42norms", noremap = true, silent = true })

			vim.keymap.set("n", "<F1>", function()
				norm.stdheader()
			end, { desc = "Insert 42header", noremap = true, silent = true })

			-- create your commands
			vim.api.nvim_create_user_command("Norminette", function()
				norm.check_norms()
			end, {})
			vim.api.nvim_create_user_command("Format", function()
				norm.format()
			end, {})
			vim.api.nvim_create_user_command("Stdheader", function()
				norm.stdheader()
			end, {})
    end,
	},
	{
	  "brenton-leighton/multiple-cursors.nvim",
	  version = "*",  -- Use the latest tagged version
	  opts = {},  -- This causes the plugin setup function to be called
	  keys = {
		{"<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move up"},
		{"<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move down"},

		{"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}, desc = "Add or remove cursor"},

		{"<Leader>m", "<Cmd>MultipleCursorsAddVisualArea<CR>", mode = {"x"}, desc = "Add cursors to the lines of the visual area"},

		{"<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = {"n", "x"}, desc = "Add cursors to cword"},
		{"<Leader>A", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = {"n", "x"}, desc = "Add cursors to cword in previous area"},

		{"<C-q>", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Add cursor and jump to next cword"},
		{"<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Jump to next cword"},

		{"<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = {"n", "x"}, desc = "Lock virtual cursors"},
	  },
},

}

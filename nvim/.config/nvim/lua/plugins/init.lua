return {
	{
	"stevearc/conform.nvim",
	-- event = 'BufWritePre', -- uncomment for format on save
	opts = require "configs.conform",
	},

	-- These are some examples, uncomment them if you want to see them work!
	-- {
	"neovim/nvim-lspconfig",
	config = function()
	  require "configs.lspconfig"
	end,
	},

{
    "MoulatiMehdi/42norm.nvim",
    config = function()
        -- On étend le PATH avec le dossier de ton venv (si nécessaire)

        local norm = require("42norm")

        -- Configuration du plugin 42norm
        norm.setup({
            header_on_save = true,
            format_on_save = true,
            liner_on_change = true,
            -- Si le plugin propose une option pour définir le chemin de la commande,
            -- tu peux la laisser ici. Sinon, Neovim devrait trouver 'norminette'
            -- via le PATH que nous venons de mettre à jour.
            -- norminette_cmd = "norminette",  -- Si nécessaire, tu peux spécifier le chemin ici
        })

        -- Les keymaps
        vim.keymap.set("n", "<F5>", function()
            norm.check_norms()
        end, { desc = "Update 42norms diagnostics", noremap = true, silent = true })

        vim.keymap.set("n", "<C-f>", function()
            norm.format()
        end, { desc = "Format buffer on 42norms", noremap = true, silent = true })

        vim.keymap.set("n", "<F1>", function()
            norm.stdheader()
        end, { desc = "Insert 42header", noremap = true, silent = true })
    end,
}

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
-- }

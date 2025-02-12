require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader><Down>", "yyp", { desc = "Duplicate line below" })
map("n", "<leader><Up>", "yyP", { desc = "Duplicate line above" })
map("v", "<leader><Down>", "y'>p", { desc = "Duplicate selected block below" })
map("v", "<leader><Up>", "y'<P", { desc = "Duplicate selected block above" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

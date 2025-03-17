require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader><Down>", "yyp", { desc = "Duplicate line below" })
map("n", "<A-Down>", ":m +1<CR>", { desc = "Move line down" })
map("n", "<A-Up>", ":m -2<CR>", { desc = "Move line up" })

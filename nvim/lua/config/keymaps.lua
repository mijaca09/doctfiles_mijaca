-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copiar/Pegar al portapapeles del sistema
-- Copiar al portapapeles con Ctrl+C en modo visual
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copiar al portapapeles del sistema" })

-- Copiar toda la línea al portapapeles con Leader+y
vim.keymap.set("n", "<leader>y", '"+yy', { desc = "Copiar línea al portapapeles" })

-- Copiar selección al portapapeles con Leader+y en modo visual
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copiar selección al portapapeles" })

-- Pegar desde el portapapeles con Leader+p
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Pegar desde portapapeles" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Pegar desde portapapeles" })

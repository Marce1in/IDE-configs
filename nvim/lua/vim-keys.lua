-- Permite subir e descer linhas
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Buffers
vim.keymap.set("n", "<C-n>", ":bn<CR>")
vim.keymap.set("n", "<C-p>", ":bp<CR>")
vim.keymap.set("n", "<C-d>", ":bd<CR>")

-- Desliga as setas
vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Down>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")

vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

vim.keymap.set("v", "<Right>", "<Nop>")
vim.keymap.set("v", "<Down>", "<Nop>")
vim.keymap.set("v", "<Left>", "<Nop>")
vim.keymap.set("v", "<Right>", "<Nop>")

-- pula 8 linhas
vim.keymap.set("n", "J", "8jzz");
vim.keymap.set("n", "K", "8kzz");

-- Muda o diretório para o diretório do arquivo aberto
vim.keymap.set("n", "cd", ":cd %:h<CR>")

-- Mostra o'que foi modificado usando o git
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})

-- Mostra em uma janelinha o erro de um linha de código
vim.keymap.set('n', 'Ç', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap=true, silent=true })

-- Crtl + c e Crtl + v
vim.keymap.set('v', '<C-c>', '"+y')
vim.keymap.set('n', '<C-v>', '"+p')

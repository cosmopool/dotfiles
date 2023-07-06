local Utils = require("utils")

-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
-- local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
-- local exprinoremap = Utils.exprinoremap
-- local tnoremap = Utils.tnoremap
-- local nmap = Utils.nmap
-- local xmap = Utils.xmap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Run omnifunc, mostly used for autocomplete
inoremap("<C-SPACE>", "<C-x><C-o>")

-- Save with Ctrl + S
nnoremap("<C-s>", ":w<CR>")

-- Close buffer
nnoremap("<C-c>", ":q<CR>")

-- Toggle term
-- nnoremap("<C-\\>", ":ToggleTerm<CR>")
-- nnoremap("<leader>ah", ":ToggleTerm<CR>")
nnoremap("<leader>a", ":ToggleTerm direction=float<CR>")

-- Github Copilot autocomplete
-- vim.g['copilot_no_tab_map'] = false
-- exprinoremap("<S-Space>", 'copilot#Accept("\\<CR>")')

-- Buffer navigation
-- nnoremap('<leader>;', ':bnext<CR>')
-- nnoremap('<leader>j', ':bprevious<CR>')
nnoremap("z;", ":BufferLineCycleNext<CR>")
nnoremap("zj", ":BufferLineCyclePrev<CR>")
-- nnoremap("<;", ":BufferNext<CR>")
-- nnoremap("<j", ":BufferPrevious<CR>")

-- Tab navigation
nnoremap("<leader>:", ":tabn<CR>")
nnoremap("<leader>J", ":tabp<CR>")

-- Move around normal mode
nnoremap("j", "h")
nnoremap("k", "j")
nnoremap("l", "k")
nnoremap(";", "l")
-- Move around visual mode
vnoremap("j", "h")
vnoremap("k", "j")
vnoremap("l", "k")
vnoremap(";", "l")

-- Move around windows
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Splits
nnoremap("<leader>ws", ":split<CR>")
nnoremap("<leader>vs", ":vsplit<CR>")

-- Popualte substitution
nnoremap("<leader>s", ":s//g<Left><Left>")
nnoremap("<leader>S", ":%s//g<Left><Left>")
nnoremap("<leader><C-s>", ":%s//gc<Left><Left><Left>")

vnoremap("<leader>s", ":s//g<Left><Left>")
vnoremap("<leader><A-s>", ":%s//g<Left><Left>")
vnoremap("<leader>S", ":%s//gc<Left><Left><Left>")

-- Yank to end of line
nnoremap("Y", "y$")

-- Copy to system clippboard
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')

-- Paste from system clippboard
nnoremap("<leader>p", '"+p')
vnoremap("<leader>p", '"+p')

-- Clear highlight search
nnoremap("<leader>nh", ":nohlsearch<CR>")
vnoremap("<leader>nh", ":nohlsearch<CR>")

-- Local list
nnoremap("<leader>lo", ":lopen<CR>")
nnoremap("<leader>lc", ":lclose<CR>")
nnoremap("<C-n>", ":lnext<CR>")
nnoremap("<C-p>", ":lprev<CR>")

-- Quickfix list
nnoremap("<leader>co", ":copen<CR>")
nnoremap("<leader>cc", ":cclose<CR>")
nnoremap("<C-N>", ":cnext<CR>")
nnoremap("<C-P>", ":cprev<CR>")

-- Fugitive
nnoremap("<leader>g", ":G<CR>")

-- Show line diagnostics
nnoremap("<leader>d", '<Cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>')

-- Open local diagnostics in local list
nnoremap("<leader>D", "<Cmd>lua vim.diagnostic.setloclist()<CR>")

-- Open all project diagnostics in quickfix list
nnoremap("<leader><A-d>", "<Cmd>lua vim.diagnostic.setqflist()<CR>")

-- Telescope
nnoremap("<leader>sf", "<Cmd>Telescope find_files<CR>")
nnoremap("<leader>sb", "<Cmd>Telescope buffers<CR>")
nnoremap("<leader>sg", "<Cmd>Telescope live_grep<CR>")

-- File explorer
nnoremap("<leader>t", "<Cmd>NvimTreeToggle<CR>") -- NvimTree

-- actions
nnoremap("grr", "<cmd>Lspsaga rename<cr>")
nnoremap("ga", "<cmd>Lspsaga code_action<cr>")
nnoremap("gx", ":<c-u>Lspsaga range_code_action<cr>")
nnoremap("gdd", "<cmd>Lspsaga hover_doc<cr>")
nnoremap("go", "<cmd>Lspsaga show_line_diagnostics<cr>")
nnoremap("gj", "<cmd>Lspsaga diagnostic_jump_next<cr>")
nnoremap("gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
nnoremap("<C-l>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")
nnoremap("<C-k>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")

-- LSP
-- nnoremap('<leader>f', ':Format')
nnoremap("<leader>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>")
nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
nnoremap("gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
nnoremap("<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
nnoremap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
nnoremap("<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

-- trouble
nnoremap("<leader>xx", "<cmd>Trouble<cr>")
nnoremap("<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
nnoremap("<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
nnoremap("<leader>xl", "<cmd>Trouble loclist<cr>")
nnoremap("<leader>xq", "<cmd>Trouble quickfix<cr>")
nnoremap("gR", "<cmd>Trouble lsp_references<cr>")

-- EasyAlign
-- xmap('ga', '<cmd>EasyAlign')
-- nmap('ga', '<cmd>EasyAlign')

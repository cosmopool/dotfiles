local Utils = require("core.utils")

local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local inoremap = Utils.inoremap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Run omnifunc, mostly used for autocomplete
inoremap("<C-SPACE>", "<C-x><C-o>")

-- Save with Ctrl + S
nnoremap("<C-s>", "<cmd>w<CR>")
-- Close buffer
nnoremap("<leader>c", "<cmd>bd<CR>")

-- Toggle term
-- nnoremap("<C-\\>", ":ToggleTerm<CR>")
-- nnoremap("<leader>ah", ":ToggleTerm<CR>")
nnoremap("<F7>", ":ToggleTerm direction=float<CR>")

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
-- nnoremap("Y", "y$")

-- Copy to system clippboard
nnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", '"+Y')
vnoremap("<leader>y", '"+y')
vnoremap("<leader>Y", '"+Y')

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
nnoremap("<leader>qo", ":copen<CR>")
nnoremap("<leader>qc", ":cclose<CR>")
nnoremap("<C-]>", ":cnext<CR>")
nnoremap("<C-[>", ":cprev<CR>")

-- Fugitive
nnoremap("<leader>g", ":G<CR>")

-- Show line diagnostics
nnoremap("<leader>d", '<Cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>')

-- Open local diagnostics in local list
nnoremap("<leader>D", "<Cmd>lua vim.diagnostic.setloclist()<CR>")

-- Open all project diagnostics in quickfix list
nnoremap("<leader><A-d>", "<Cmd>lua vim.diagnostic.setqflist()<CR>")

if Utils.is_available "telescope.nvim" then
  nnoremap("<leader>fa", "<Cmd>Telescope find_files<CR>")
  nnoremap("<leader>fw", "<Cmd>Telescope live_grep<CR>")
  nnoremap("<leader>ff", "<Cmd>Telescope git_files<CR>")
  nnoremap("<leader>f;", "<Cmd>Telescope buffers<CR>")
  nnoremap("<leader>fl", "<Cmd>Telescope flutter commands<CR>")
  nnoremap("<leader>fr", "<Cmd>Telescope lsp_references<CR>")
  --vim.keymap.set("n", "<leader>fk", function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ")}) end)
end

if Utils.is_available "neo-tree.nvim" then
  nnoremap("<leader>e", "<Cmd>Neotree<CR>")
end

if Utils.is_available "lspsaga.nvim" then
  nnoremap("grr", "<cmd>Lspsaga rename<cr>")
  nnoremap("ga", "<cmd>Lspsaga code_action<cr>")
  nnoremap("gx", ":<c-u>Lspsaga range_code_action<cr>")
  nnoremap("gh", "<cmd>Lspsaga hover_doc<cr>")
  nnoremap("go", "<cmd>Lspsaga show_line_diagnostics<cr>")
  nnoremap("gj", "<cmd>Lspsaga diagnostic_jump_next<cr>")
  nnoremap("gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
  --nnoremap("<C-l>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")
  --nnoremap("<C-k>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")
end

-- LSP
nnoremap("<leader>fs", "<cmd>lua vim.lsp.buf.format()<CR>")
nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
nnoremap("gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
nnoremap("gte", "<cmd>lua vim.diagnostic.open_float()<CR>")
nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
nnoremap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
nnoremap("<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

-- GITSIGNS
if Utils.is_available "gitsings.nvim" then
  local gitsigns = require("gitsigns")
  nnoremap("]g", gitsigns.next_hunk())
  nnoremap("[g", gitsigns.prev_hunk())
  nnoremap("<leader>gl", gitsigns.blame_line())
  nnoremap("<leader>gL", gitsigns.blame_line { full = true })
  nnoremap("<leader>gp", gitsigns.preview_hunk())
  nnoremap("<leader>gh", gitsigns.reset_hunk())
  nnoremap("<leader>gr", gitsigns.reset_buffer())
  nnoremap("<leader>gs", gitsigns.stage_hunk())
  nnoremap("<leader>gS", gitsigns.stage_buffer())
  nnoremap("<leader>gu", gitsigns.undo_stage_hunk())
  nnoremap("<leader>gd", gitsigns.diffthis())
end

if Utils.is_available "nvim-dap" then
  nnoremap("<F5>", "<cmd>DapContinue<CR>")
  nnoremap("<F17>", "<cmd>DapTerminate<CR>")
  nnoremap("<F29>", "<cmd>lua require('dap').restart_frame()")
  nnoremap("<F6>", "<cmd>DapPause<CR>")
  nnoremap("<F9>", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
  nnoremap("<F10>", "<cmd>DapStepOver<CR>")
  nnoremap("<F11>", "<cmd>DapStepInto<CR>")
  nnoremap("<F23>", "<cmd>DapStepOut<CR>")
  nnoremap("<leader>db", "<cmd>DapToggleBreakpoint<CR>")
  nnoremap("<leader>dB", "<cmd>lua require('dap').clear_breakpoints()")
  nnoremap("<leader>dc", "<cmd>DapContinue<CR>")
  nnoremap("<leader>di", "<cmd>DapStepInto<CR>")
  nnoremap("<leader>do", "<cmd>DapStepOver<CR>")
  nnoremap("<leader>dO", "<cmd>DapStepOut<CR>")
  nnoremap("<leader>dq", "<cmd>DapClose<CR>")
  nnoremap("<leader>dQ", "<cmd>DapTerminate<CR>")
  nnoremap("<leader>dp", "<cmd>DapPause<CR>")
  nnoremap("<leader>dr", "<cmd>DapRestartFrame<CR>")
  nnoremap("<leader>dR", "<cmd>DapToggleRepl")
end

if Utils.is_available "nvim-dap-ui" then
  -- local dap_ui = require("dapui")
  nnoremap("<leader>du", "<cmd>lua require('dapui').toggle()<CR>")
  nnoremap("<leader>dh", "<cmd>lua require('dapui').expand()<CR>")
  nnoremap("<leader>dh", "<cmd>lua require('dap.ui.widgets').hover()<CR>")
end

if Utils.is_available "trouble" then
  nnoremap("<leader>xx", "<cmd>Trouble<cr>")
  nnoremap("<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
  nnoremap("<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
  nnoremap("<leader>xl", "<cmd>Trouble loclist<cr>")
  nnoremap("<leader>xq", "<cmd>Trouble quickfix<cr>")
  nnoremap("gR", "<cmd>Trouble lsp_references<cr>")
end

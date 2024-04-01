-- For more options, you can see `:help option-list`

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_banner = 0

vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed

local options = {
	autoindent = true,
	backspace = "indent,eol,start",
	backup = false,
	breakindent = true,
	clipboard = "unnamedplus",
	colorcolumn = "120",
	completeopt = "menu,menuone,noselect",
	cursorline = true,
	fileencoding = "utf-8",
	foldlevelstart = 666,
	foldmethod = "indent",
	grepprg = "rg --vimgrep --no-heading --smart-case",
	hlsearch = true,
	ignorecase = true,
	inccommand = "split", -- Preview substitutions live, as you type!
	list = true,
	listchars = { tab = "» ", trail = "·", nbsp = "␣" },
	mouse = "a",
	number = true,
	relativenumber = true,
	scrolloff = 10,
	shiftwidth = 2,
	showmode = false,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	softtabstop = 2,
	spell = true,
	spelllang = "en_us",
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 2,
	termguicolors = true,
	timeoutlen = 300,
	undofile = true,
	updatetime = 250,
	writebackup = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.iskeyword:append("-")
-- vim.opt.shortmess:append({ W = true, I = true, c = true })
--
-- if vim.fn.has("nvim-0.9.0") == 1 then
-- 	vim.opt.splitkeep = "screen"
-- 	vim.opt.shortmess:append({ C = true })
-- end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

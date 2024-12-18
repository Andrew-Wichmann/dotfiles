require("twistedchurro")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim', {'BurntSushi/ripgrep', build = {"cargo build --release && cp target/release/rg $HOME/.local/bin"}} }
	},
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	{ 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/playground"},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{ "nvim-treesitter/playground"},
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
    { "github/copilot.vim" },
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', dependencies = {
		{'neovim/nvim-lspconfig'},
		{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/nvim-cmp'},
		{'L3MON4D3/LuaSnip'},
		{'williamboman/mason.nvim'},
		{'williamboman/mason-lspconfig.nvim'},
	}},
    { 'mhartington/formatter.nvim' },
})


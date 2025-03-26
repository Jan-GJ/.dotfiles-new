return {
	"tjdevries/colorbuddy.nvim",
	dependencies = {
		--		"folke/tokyonight.nvim",
	},
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
	},
	config = function(_, opts)
		--		require("tokyonight").setup(opts)
		vim.cmd([[colorscheme gruvbuddy]])
	end,
}

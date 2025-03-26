return {
	"folke/tokyonight.nvim",
	dependencies = {
		-- "tjdevries/colorbuddy.nvim",
	},
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		-- vim.cmd([[colorscheme gruvbuddy]])
		vim.cmd([[colorscheme tokyonight-night]])
	end,
}

return {
	"supermaven-inc/supermaven-nvim",
	opts = {
		keymaps = {
			accept_suggestion = "<C-k>",
		},
	},
	config = function(_, opts)
		require("supermaven-nvim").setup(opts)
	end,
}

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		panel = {
			enable = false,
		},
		suggestion = {
			auto_trigger = true,
			debounce = 100,
			keymap = {
				accept = "<C-k>",
				next = false,
				prev = false,
			},
		},
	},
	config = function(_, opts)
		require("copilot").setup(opts)
	end,
}

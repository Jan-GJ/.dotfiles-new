return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		indent = {
			highlight = "IblScope",
			char = "▏",
		},
		scope = {
			highlight = "@keyword",
		},
	},
}

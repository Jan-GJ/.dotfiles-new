return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local myTheme = require("lualine.themes.tokyonight")
		myTheme.normal.c.bg = "None" --transparent
		require("lualine").setup({
			theme = myTheme,
			options = {
				icons_enabled = false,
				theme = myTheme,
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "filetype", "encoding", "fileformat" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}

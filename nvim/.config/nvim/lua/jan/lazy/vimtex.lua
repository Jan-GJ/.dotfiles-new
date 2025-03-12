return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	-- tag = "v2.15", -- uncomment to pin to a specific release
	config = function()
		vim.g.vimtex_view_general_viewer = "zathura"
		vim.g.tex_flavor = "latex"
		vim.g.vimtex_quickfix_mode = 0
		--
		--keymap
		vim.keymap.set("n", "<leader>lb", ":VimtexCompile<CR>")
	end,
}

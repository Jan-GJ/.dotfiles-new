return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		{ "williamboman/mason-lspconfig.nvim", config = function() end },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	opts = {
		formatters = {
			-- lua formatter
			stylua = {},
		},
		servers = {
			-- lua lsp
			lua_ls = {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						workspace = {
							checkThirdPary = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							--disable = { "missing-fields" }
						},
					},
				},
			},
			-- typescript lsp
			vtsls = {
				settings = {
					complete_function_calls = true,
					vtsls = {
						enableMoveToFileCodeAction = true,
						autoUseWorkspaceTsdk = true,
						experimental = {
							maxInlayHintLength = 30,
							completion = {
								enableServerSideFuzzyMatch = true,
							},
						},
					},
					typescript = {
						updateImportsOnFileMove = { enabled = "always" },
						suggest = {
							completeFunctionCalls = true,
						},
						inlayHints = {
							enumMemberValues = { enabled = true },
							functionLikeReturnTypes = { enabled = true },
							parameterNames = { enabled = "literals" },
							parameterTypes = { enabled = true },
							propertyDeclarationTypes = { enabled = true },
							variableTypes = { enabled = false },
						},
					},
				},
			},
			-- go lsp
			gopls = {},
		},
	},
	config = function(_, opts)
		local servers = vim.tbl_keys(opts.servers or {})
		local formatters = vim.tbl_keys(opts.formatters or {})

		--keybinds
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			end,
		})

		-- formatters
		local mason_tool_installer = require("mason-tool-installer")
		mason_tool_installer.setup({
			ensure_installed = formatters,
		})

		-- lsp
		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({
			---@type string[]
			ensure_installed = servers,

			---@type boolean
			automatic_installation = false,

			---@type table<string, fun(server_name: string)>?
			handlers = {
				function(server_name)
					local server_opts = opts.servers[server_name] or {}

					--add blink capabilities
					server_opts.capabilities = require("blink.cmp").get_lsp_capabilities(server_opts.capabilities)

					require("lspconfig")[server_name].setup(server_opts or {})
				end,
			},
		})
	end,
}

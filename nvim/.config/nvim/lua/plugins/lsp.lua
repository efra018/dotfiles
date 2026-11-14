return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		"mason-org/mason.nvim",
		"saghen/blink.cmp",
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
	config = function()
		-- Atajos globales de diagnósticos (<leader>d para ver el error flotante)
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Mostrar diagnóstico flotante" })
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, { desc = "Diagnóstico anterior" })
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, { desc = "Siguiente diagnóstico" })
		vim.keymap.set("n", "<space>lq", vim.diagnostic.setloclist, { desc = "Lista de diagnósticos" })

		-- Atajos locales cuando un LSP se conecta al buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(ev)
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover({ border = "rounded" })
				end, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			end,
		})

		-- Conectar capacidades de blink.cmp de forma segura con todos los LSP
		local has_blink, blink = pcall(require, "blink.cmp")
		local capabilities = has_blink and blink.get_lsp_capabilities() or vim.lsp.protocol.make_client_capabilities()

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- 1. Configuración de Clangd
		vim.lsp.config("clangd", {
			cmd = { "clangd" },
		})

		-- 2. Configuración de Lua
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		-- 3. Configuración de Dart
		-- vim.lsp.config("dartls", {
		-- 	cmd = { "dart", "language-server", "--protocol=lsp" },
		-- })

		-- Habilitar los servidores activos
		vim.lsp.enable({ "clangd", "lua_ls", "basedpyright" })

		-- Configuración unificada de diagnósticos
		vim.diagnostic.config({
			underline = true,
			virtual_text = true,
			update_in_insert = true,
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "",
					[vim.diagnostic.severity.INFO] = "",
				},
			},
			float = {
				style = "minimal",
				border = "rounded",
				source = "always",
			},
		})
	end,
}

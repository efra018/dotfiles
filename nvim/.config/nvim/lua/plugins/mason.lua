return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			PATH = "prepend",
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- automatic_enable = true (por defecto en v2+) llama a vim.lsp.enable()
		-- automáticamente para todo lo que instales con Mason.
		require("mason-lspconfig").setup({
			automatic_enable = true,
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"clangd",
				"clang-format",
				"codelldb",
				--"basedpyright",
				--"eslint_d",
				--"prettierd",
			},
		})
	end,
}

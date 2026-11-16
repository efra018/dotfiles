return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = { "n", "v" },
			desc = "Formatear código (Conform)",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format" },
			c = { "clang-format" },
			cpp = { "clang-format" },
		},
		-- Configuraciones específicas para respetar los espacios de cada lenguaje
		formatters = {
			["clang-format"] = {
				-- Fuerza 4 espacios de indentación en C y C++ incluso si no hay archivo .clang-format en el proyecto
				prepend_args = { "--style={BasedOnStyle: LLVM, IndentWidth: 8, TabWidth: 8, UseTab: Always}" },
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}

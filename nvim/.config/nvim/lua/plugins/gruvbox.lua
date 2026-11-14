return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000, -- Asegura que el tema cargue antes que todos los demás plugins
	lazy = false,
	opts = {
		terminal_colors = true,
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = true,
			emphasis = true,
			comments = true,
			operators = false,
			folds = true,
		},
		contrast = "", -- Opciones: "hard", "soft" o "" (medio por defecto)
		transparent_mode = false, -- Cambia a true si quieres fondo transparente
	},
	config = function(_, opts)
		require("gruvbox").setup(opts)
		vim.o.background = "dark" -- Cambia a "light" si prefieres modo claro
		vim.cmd.colorscheme("gruvbox")
	end,
}

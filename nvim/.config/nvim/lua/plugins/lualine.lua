return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = "gruvbox", -- Se adapta directamente a tu tema Gruvbox
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			globalstatus = true, -- Una sola barra limpia en la parte inferior aunque dividas ventanas
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {
				{ "filename", path = 1 }, -- Muestra ruta relativa (ej. lua/plugins/lualine.lua)
				"lsp_status", -- Componente nativo de Lualine que muestra los LSP activos
			},
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
	},
}

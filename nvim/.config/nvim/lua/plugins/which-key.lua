return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern", -- Diseño flotante limpio y compacto
		delay = 300, -- Tiempo en milisegundos antes de aparecer al presionar <Space>
		spec = {
			-- Agrupa tus atajos bajo etiquetas claras en el menú
			{ "<leader>f", group = "Buscar (Files/Grep)" },
			{ "<leader>n", group = "Notificaciones / Búsqueda" },
			{ "<leader>u", group = "Interfaz (UI)" },
			{ "<leader>b", group = "Buffers" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Ver atajos locales del buffer",
		},
	},
}

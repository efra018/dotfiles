return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		notifier = { enabled = true, timeout = 3000 },
		indent = { enabled = true },
		scroll = { enabled = true },
		bigfile = { enabled = true },
		input = { enabled = true },
		explorer = {
			enabled = true,
			replace_netrw = true,
		},
		picker = {
			enabled = true,
			sources = {
				explorer = {
					win = {
						list = {
							keys = {
								-- Abre carpetas y archivos con la tecla 'o'
								["o"] = "confirm",
							},
						},
					},
				},
			},
		},
	},
	keys = {
		-- Explorador de archivos (árbol lateral)

		{
			"<leader>o",
			function()
				local explorer = Snacks.picker.get({ source = "explorer" })[1]
				if explorer then
					explorer:focus()
				else
					Snacks.explorer()
				end
			end,
			desc = "Enfocar explorador de archivos",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "Abrir/cerrar explorador de archivos",
		},

		-- Notificaciones
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Ocultar notificaciones",
		},
		{
			"<leader>nh",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Historial de notificaciones",
		},

		-- Buscador de archivos y texto (Snacks.picker)
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Buscar archivos",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Buscar texto (Live Grep)",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buscar buffers abiertos",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Buscar en la ayuda",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Archivos recientes",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Buscar en config de Nvim",
		},
	},
}

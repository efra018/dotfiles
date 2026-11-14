return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		keymap = {
			preset = "enter",
			-- Tab navega al siguiente elemento (o salta en un snippet)
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			-- Shift+Tab navega al elemento anterior (o retrocede en un snippet)
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			trigger = {
				show_on_keyword = true,
				show_on_trigger_character = true,
			},
			menu = {
				auto_show = true,
				border = "rounded",
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = { border = "rounded" },
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		cmdline = {
			enabled = true,
			keymap = {
				preset = "inherit", -- Hereda Tab y Shift+Tab también en la línea de comandos
			},
			completion = {
				menu = {
					auto_show = true,
				},
			},
		},

		signature = {
			enabled = true,
			window = { border = "rounded" },
		},
	},
	opts_extend = { "sources.default" },
}

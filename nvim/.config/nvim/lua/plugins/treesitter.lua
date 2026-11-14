return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		-- Asegura que la carpeta de parsers esté en el runtimepath
		vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")

		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"c",
				"cpp",
				"dart",
				"python",
				"javascript",
				"typescript",
				"json",
				"yaml",
				"markdown",
				"bash",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}

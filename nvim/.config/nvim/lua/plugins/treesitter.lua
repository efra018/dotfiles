return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	main = "nvim-treesitter",
	opts = {
		ensure_installed = {
			"c",
			"cpp",
			"python",
			"json",
			"yaml",
			"bash",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
}

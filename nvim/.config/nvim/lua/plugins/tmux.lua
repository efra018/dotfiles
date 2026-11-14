local function navigate_left()
	-- Si no estamos ya dentro del explorador y este está abierto, le pasamos el foco
	if vim.bo.filetype ~= "snacks_picker_list" then
		local explorer = Snacks.picker.get({ source = "explorer" })[1]
		if explorer then
			explorer:focus()
			return
		end
	end
	-- Si el explorador está cerrado o ya estamos dentro de él, navega normal (Nvim/Tmux)
	vim.cmd("TmuxNavigateLeft")
end

return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		-- Mapea tanto <C-h> como <BS> (la señal ^H que envía Lubuntu al pulsar Ctrl+h)
		{ "<C-h>", navigate_left, desc = "Mover izquierda o enfocar explorador" },
		{ "<BS>", navigate_left, desc = "Mover izquierda o enfocar explorador (compatibilidad terminal)" },
		{ "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Mover abajo (Nvim/Tmux)" },
		{ "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Mover arriba (Nvim/Tmux)" },
		{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Mover derecha (Nvim/Tmux)" },
		{ "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Panel anterior (Nvim/Tmux)" },
	},
}

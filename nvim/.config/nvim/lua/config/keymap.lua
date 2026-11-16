-- Nota: Asegúrate de tener vim.g.mapleader = " " al inicio de tu init.lua
local keymap = vim.keymap

-- Recargar archivo actual
-- keymap.set("n", "<leader>so", "<Cmd>source %<CR>", { desc = "Recargar archivo actual" })

keymap.set("n", "<leader>so", function()
	vim.cmd("source %")
	vim.notify("Archivo recargado: " .. vim.fn.expand("%:t"), vim.log.levels.INFO)
end, { desc = "Recargar archivo actual" })
-- Quitar resaltado de búsqueda
keymap.set("n", "<leader>nh", "<Cmd>nohlsearch<CR>", { desc = "Quitar resaltado de búsqueda" })

-- Guardar y salir (usando <leader> para no romper <C-w> de las ventanas)
keymap.set("n", "<leader>w", "<Cmd>w<CR>", { desc = "Guardar archivo" })
keymap.set("n", "<leader>q", "<Cmd>q<CR>", { desc = "Salir" })
keymap.set("n", "<leader>qq", "<Cmd>qall<CR>", { desc = "Salir de todo" })
keymap.set("n", "<leader>x", "<Cmd>wq<CR>", { desc = "Guardar y salir" })

-- Moverse entre buffers
keymap.set("n", "<Tab>", "<Cmd>bnext<CR>", { desc = "Siguiente buffer" })
keymap.set("n", "<S-Tab>", "<Cmd>bprevious<CR>", { desc = "Buffer anterior" })

-- Cerrar buffer actual (mejor con <leader>bd para no romper el comando nativo 'cl')
keymap.set("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Cerrar buffer actual" })

-- Cerrar todos los buffers excepto el actual
keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Cerrar otros buffers" })

-- Mantener selección visual al tabular
keymap.set("v", ">", ">gv", { desc = "Tabular a la derecha" })
keymap.set("v", "<", "<gv", { desc = "Tabular a la izquierda" })

-- Centrar pantalla al saltar entre resultados de búsqueda
-- keymap.set("n", "n", "nzzzv", { desc = "Siguiente resultado centrado" })
-- keymap.set("n", "N", "Nzzzv", { desc = "Resultado anterior centrado" })

-- Compilar y ejecutar archivo C/C++

vim.keymap.set("n", "<leader>r", function()
	if vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
		vim.cmd("write")

		-- Guarda exactamente la ventana de tu código antes de abrir la terminal
		local code_win = vim.api.nvim_get_current_win()

		local file = vim.fn.shellescape(vim.fn.expand("%"))
		local cmd = string.format(
			"mkdir -p build && gcc -g %s -o build/programa && echo '--- SALIDA ---' && ./build/programa; echo '\n--- FIN ---'",
			file
		)

		-- Abre el panel inferior de 12 líneas y deja el foco ahí
		vim.cmd("botright 20new")
		vim.fn.termopen({ "sh", "-c", cmd })

		-- Función para cerrar la terminal y saltar directo a la ventana de código
		local close_and_focus_code = function()
			vim.cmd("close")
			if vim.api.nvim_win_is_valid(code_win) then
				vim.api.nvim_set_current_win(code_win)
			end
		end

		-- Mapea 'q' y 'Esc' localmente para ejecutar esa función
		local opts = { buffer = true, silent = true }
		vim.keymap.set("n", "q", close_and_focus_code, opts)
		vim.keymap.set("n", "<Esc>", close_and_focus_code, opts)
	else
		print("Este atajo solo está configurado para archivos C/C++")
	end
end, { desc = "Compilar, ejecutar y volver al código al cerrar" })

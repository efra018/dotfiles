return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text", -- Muestra el valor de las variables al lado de cada línea
	},
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Poner/quitar breakpoint",
		},
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "Iniciar / Continuar depuración",
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			desc = "Entrar en función (Step Into)",
		},
		{
			"<leader>do",
			function()
				require("dap").step_over()
			end,
			desc = "Siguiente línea (Step Over)",
		},
		{
			"<leader>dO",
			function()
				require("dap").step_out()
			end,
			desc = "Salir de función (Step Out)",
		},
		{
			"<leader>dt",
			function()
				require("dap").terminate()
			end,
			desc = "Detener depuración",
		},
		{
			"<leader>du",
			function()
				require("dapui").toggle()
			end,
			desc = "Abrir/cerrar panel visual DAP",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup()
		require("nvim-dap-virtual-text").setup()

		-- Abrir y cerrar la interfaz visual automáticamente al depurar
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Iconos visuales para los breakpoints en el margen
		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
		vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticWarn", linehl = "Visual" })

		-- Configurar el adaptador codelldb instalado por Mason
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		-- Configuración de lanzamiento para C y C++

		local cpp_config = {
			{
				name = "Depurar ejecutable (codelldb)",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Ruta del ejecutable: ", vim.fn.getcwd() .. "/build/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				sourceLanguages = { "c", "cpp" },
				initCommands = {
					"settings set target.process.thread.step-avoid-regexp ^std::",
					"settings set stop-disassembly-display never",
				},
			},
		}

		dap.configurations.c = cpp_config
		dap.configurations.cpp = cpp_config
	end,
}

return {
	"mhartington/formatter.nvim",
	config = function()
		local filetype = {}

		local function set(filetypes, value, lone)
			lone = lone or false

			if type(filetypes) == "table" then
				for _, ft in ipairs(filetypes) do
					if not filetype[ft] or lone then
						filetype[ft] = {}
					end
					table.insert(filetype[ft], value)
				end
			elseif type(filetypes) == "string" then
				if not filetype[filetypes] or lone then
					filetype[filetypes] = {}
				end
				table.insert(filetype[filetypes], value)
			end
		end

		-- [[ Using CLI ]]
		if vim.fn.executable("stylua") == 1 then
			set({ "lua", "luau" }, require("formatter.filetypes.lua").stylua)
		end

		if vim.fn.executable("prettierd") == 1 then
			set({
				"css",
				"html",
				"json",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"svelte",
				"vue",
				"yaml",
			}, require("formatter.defaults.prettierd"))
		elseif vim.fn.executable("prettier") == 1 then
			set({
				"css",
				"html",
				"json",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"svelte",
				"vue",
				"yaml",
			}, require("formatter.defaults.prettier"))
		end

		if vim.fn.executable("taplo") == 1 then
			set({ "toml" }, require("formatter.filetypes.toml").taplo)
		end

		-- [[ Using LSP ]]
		set({
			"rust",
		}, vim.lsp.buf.format)

		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = filetype,
		})

		-- [[ Auto Format ]]
		local format_is_enabled = true

		vim.api.nvim_create_user_command("ToggleFormatOnSave", function()
			format_is_enabled = not format_is_enabled
			print("Setting autoformatting to: " .. tostring(format_is_enabled))
		end, {})

		vim.keymap.set("n", "<leader>f", "<cmd>Format<cr>", { desc = "Format current buffer with LSP" })

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				if not format_is_enabled then
					return
				end
				vim.cmd("Format")
			end,
		})
	end,
}

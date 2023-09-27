return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		local have_neodev, neodev = pcall(require, "neodev")
		if have_neodev then
			neodev.setup()
		end

		local have_telescope_builtin, telescope_builtin = pcall(require, "telescope.builtin")

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		local have_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		if have_cmp_nvim_lsp then
			capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
		end

		require("mason").setup()

		mason_lspconfig.setup()
		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
					on_attach = function(_, bufnr)
						local nmap = function(keys, func, desc)
							if desc then
								desc = "LSP: " .. desc
							end

							vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
						end
						-- [[ Set Keymaps ]]
						nmap("K", vim.lsp.buf.hover, "Hover Documentation")
						nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
						nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
						nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
						nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
						nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
						nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
						nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")

						if have_telescope_builtin then
							nmap("gr", telescope_builtin.lsp_references, "[G]oto [R]eferences")
							nmap("<leader>ds", telescope_builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
							nmap("<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
						end
					end,
				})
			end,
		})
	end,
}

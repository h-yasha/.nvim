local utils = require("utils")
local mason_lspconfig = require("mason-lspconfig")

local servers = mason_lspconfig.get_installed_servers()

if (utils.in_table(servers, "jsonls")) then
	require('lspconfig').jsonls.setup {
		settings = {
			json = {
				schemas = require('schemastore').json.schemas(),
				validate = { enable = true },
			},
		},
	}
end

if (utils.in_table(servers, "yamlls")) then
	require('lspconfig').yamlls.setup {
		settings = {
			yaml = {
				schemaStore = {
					-- You must disable built-in schemaStore support if you want to use
					-- this plugin and its advanced options like `ignore`.
					enable = false,
				},
				schemas = require('schemastore').yaml.schemas(),
			},
		},
	}
end

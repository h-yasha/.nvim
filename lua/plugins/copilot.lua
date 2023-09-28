return {
	"zbirenbaum/copilot.lua",
	opts = {
		panel = {
			enabled = true,
			auto_refresh = true,
			keymap = {
				jump_prev = "[[",
				jump_next = "]]",
				accept = "<CR>",
				refresh = "gr",
				open = "<A-g>",
			},
			layout = {
				position = "bottom", -- | top | left | right
				ratio = 0.4,
			},
		},
		suggestion = {
			enabled = true,
			auto_trigger = true,
			debounce = 75,
			keymap = {
				accept = "<Tab>",
				accept_word = false,
				accept_line = false,
				next = "<A-]>",
				prev = "<A-[>",
				dismiss = "<esc>",
			},
		},
		filetypes = {
			help = false,
			gitcommit = false,
			gitrebase = false,
			hgcommit = false,
			svn = false,
			cvs = false,
		},
		copilot_node_command = "node",
		server_opts_overrides = {},
	},
}

return {
	"carlos-algms/agentic.nvim",
	opts = {
		provider = "claude-acp",
		acp_providers = {
			["claude-acp"] = {
				name = "Claude ACP",
				command = "claude-code-acp",
				env = {
					CLAUDE_CONFIG_DIR = os.getenv("CLAUDE_CONFIG_DIR"),
				},
			},
		},
		windows = {
			position = "right",
			width = "30%",
		},
	},
	keys = {
		{
			"<leader>aa",
			function()
				require("agentic").toggle()
			end,
			mode = { "n", "v", "i" },
			desc = "Toggle Agentic Chat",
		},
		{
			"<leader>as",
			function()
				require("agentic").add_selection_or_file_to_context()
			end,
			mode = { "n", "v" },
			desc = "Add file or selection to Agentic to Context",
		},
		{
			"<leader>ac",
			function()
				require("agentic").new_session()
			end,
			mode = { "n", "v", "i" },
			desc = "New Agentic Session",
		},
		{
			"<leader>ar",
			function()
				require("agentic").restore_session()
			end,
			desc = "Agentic Restore session",
			silent = true,
			mode = { "n", "v", "i" },
		},
	},
}

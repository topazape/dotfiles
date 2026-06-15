return {
	"carlos-algms/agentic.nvim",

	opts = {
		provider = "claude-agent-acp",

		acp_providers = {
			["claude-agent-acp"] = {
				env = {
					CLAUDE_CONFIG_DIR = os.getenv("CLAUDE_CONFIG_DIR"),
					ANTHROPIC_DEFAULT_OPUS_MODEL = "claude-opus-4-6",
				},
				initial_model = "opus[1m]",
			},
		},

		windows = {
			position = "right",
			width = "30%",
		},

		diff_preview = {
			enabled = true,
			layout = "inline",
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

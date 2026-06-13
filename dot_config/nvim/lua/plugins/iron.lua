return {
	"Vigemus/iron.nvim",

	ft = "r",

	config = function()
		local iron = require("iron.core")
		local view = require("iron.view")
		local common = require("iron.fts.common")

		iron.setup({
			config = {
				scratch_repl = true,

				repl_definition = {
					r = {
						command = { "arf" },
						format = common.bracketed_paste,
					},
				},

				repl_open_cmd = view.split.vertical.botright(50),
			},

			keymaps = {
				toggle_repl = "<space>rr",
				restart_repl = "<space>rR",
				send_motion = "<space>sc",
				visual_send = "<space>sc",
				send_line = "<space>sl",
				send_file = "<space>sf",
				interrupt = "<space>s<space>",
				exit = "<space>sq",
			},

			ignore_blank_lines = true,
		})
	end,
}

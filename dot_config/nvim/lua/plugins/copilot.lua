return {
			"zbirenbaum/copilot.lua",
			opts = {
				filetypes = {
					txt = true,
					markdown = true,
					json = true,
					yaml = true,
					toml = true,
					sql = true,
					dbt = true,
					["*"] = false,
				},
				panel = {
					enabled = false,
				},
				suggestion = {
					-- enabled = true,
					enabled = false,
					auto_trigger = true,
					hide_during_completion = true,
					debounce = 25,
					keymap = {
						accept = "<M-f>",
						next = "<M-n>",
						prev = "<M-p>",
						dissmiss = "<M-q>",
					},
				},
			},
		}

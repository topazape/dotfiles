local noice = require("noice")

-- vim.keymap.set({ "n", "i" }, "<C-n>", function()
-- 	require("noice.lsp").scroll(4)
-- end, { silent = true })
-- vim.keymap.set({ "n", "i" }, "<C-p>", function()
-- 	require("noice.lsp").scroll(-4)
-- end, { silent = true })

noice.setup({
	cmdline = {
		format = {
			cmdline = { pattern = "^:", icon = "", lang = "vim" },
			search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = "", lang = "regex" },
		},
	},
	lsp = {
		progress = { enabled = true },
		override = {
			-- override the default lsp markdown formatter with Noice
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			-- override the lsp markdown formatter with Noice
			["vim.lsp.util.stylize_markdown"] = true,
			-- override cmp documentation with Noice (needs the other options to work)
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		-- you can enable a preset by setting it to true, or a table that will override the preset config
		-- you can also add custom presets that you can enable/disable with enabled=true
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
})

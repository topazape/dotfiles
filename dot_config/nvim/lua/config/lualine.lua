local lualine = require("lualine")

local lsp_names = function()
	local clients = {}
	for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
		table.insert(clients, client.name)
	end
	return "  " .. table.concat(clients, ", ")
end

lualine.setup({
	options = {
		theme = "auto",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{ "mode" },
		},
		lualine_b = {
			{ "branch" },
			{ "diff", symbols = { added = "󰐖 ", modified = "󰦓 ", removed = "󰍵 " } },
		},
		lualine_c = {
			{ "filename", path = 3 },
		},
		lualine_x = {
			{ "filetype" },
			{ "encoding" },
			{ "fileformat", icons_enabled = false },
		},
		lualine_y = {
			{ "progress" },
		},
		lualine_z = {
			{ "location" },
		},
	},
	tabline = {
		lualine_b = {
			{ "filename", path = 0 },
			{ "diagnostics" },
		},
		lualine_x = {
			{ lsp_names },
		},
	},
})

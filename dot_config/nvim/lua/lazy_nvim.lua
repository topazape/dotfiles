-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins.oldtale" },

		{ import = "plugins.agentic" },
		{ import = "plugins.blink-cmp" },
		{ import = "plugins.conform" },
		{ import = "plugins.copilot" },
		{ import = "plugins.lspsaga" },
		{ import = "plugins.lualine" },
		{ import = "plugins.render-markdown" },
		{ import = "plugins.snacks" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.gopher" },
		{ import = "plugins.godoc" },

		{
			"daliusd/ghlite.nvim",
			config = function()
				require("ghlite").setup({
					debug = false, -- if set to true debugging information is written to ~/.ghlite.log file
					view_split = "vsplit", -- set to empty string '' to open in active buffer, use 'tabnew' to open in tab
					diff_split = "vsplit", -- set to empty string '' to open in active buffer, use 'tabnew' to open in tab
					diff_tool = "codediff", -- 'diffview', 'codediff', or 'auto' - which tool to use for GHLitePRDiffview
					comment_split = "split", -- set to empty string '' to open in active buffer, use 'tabnew' to open in tab
					open_command = "open", -- open command to use, e.g. on Linux you might want to use xdg-open
					merge = {
						approved = "--squash",
						nonapproved = "--auto --squash",
					},
					html_comments_command = { "lynx", "-stdin", "-dump" }, -- command to render HTML comments in PR view
					-- override default keymaps with the ones you prefer
					-- set keymap to false or '' to disable it
					keymaps = {
						diff = {
							open_file = "gf",
							open_file_tab = "",
							open_file_split = "o",
							open_file_vsplit = "O",
							approve = "cA",
							request_changes = "cR",
						},
						comment = {
							send_comment = "c<CR>", -- this one cannot be disabled
						},
						pr = {
							approve = "cA",
							request_changes = "cR",
							merge = "cM",
							comment = "ca",
							diff = "cp",
						},
					},
				})
			end,
			keys = {
				{ "<leader>us", ":GHLitePRSelect<cr>", silent = true, desc = "PR Select" },
				{ "<leader>uo", ":GHLitePRCheckout<cr>", silent = true, desc = "PR Checkout" },
				{ "<leader>uv", ":GHLitePRView<cr>", silent = true, desc = "PR View" },
				{ "<leader>uu", ":GHLitePRLoadComments<cr>", silent = true, desc = "PR Load Comments" },
				{ "<leader>up", ":GHLitePRDiff<cr>", silent = true, desc = "PR Diff" },
				{ "<leader>ul", ":GHLitePRDiffview<cr>", silent = true, desc = "PR Diffview" },
				{ "<leader>ua", ":GHLitePRAddComment<cr>", silent = true, desc = "PR Add comment" },
				{
					"<leader>ua",
					":GHLitePRAddComment<cr>",
					mode = "x",
					silent = true,
					desc = "PR Add comment",
				},
				{ "<leader>uc", ":GHLitePRUpdateComment<cr>", silent = true, desc = "PR Update comment" },
				{ "<leader>ud", ":GHLitePRDeleteComment<cr>", silent = true, desc = "PR Delete comment" },
				{ "<leader>ug", ":GHLitePROpenComment<cr>", silent = true, desc = "PR Open comment" },
			},
		},
		{
			"esmuellert/codediff.nvim",
			cmd = "CodeDiff",
		},
		{ "HiPhish/rainbow-delimiters.nvim" },
		{ "OXY2DEV/helpview.nvim" },
		{ "PedramNavid/dbtpal", dependencies = { "nvim-lua/plenary.nvim" }, config = true },
		{ "akinsho/git-conflict.nvim", version = "*", config = true },
		{ "b0o/schemastore.nvim" },
		{ "chomosuke/typst-preview.nvim", ft = "typst", version = "1.*", config = true },
		{ "folke/ts-comments.nvim", event = "VeryLazy", config = true },
		{ "j-hui/fidget.nvim", config = true },
		{ "magal1337/dataform.nvim", config = true },
		{ "nvim-tree/nvim-web-devicons", config = true },
		{ "tzachar/highlight-undo.nvim", config = true },
		{ "williamboman/mason.nvim", config = true },
		{
			"rainbowhxch/accelerated-jk.nvim",
			config = function()
				vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
				vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})
			end,
		},
	},
})

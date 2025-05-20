return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Documents/Obsidian",
			},
		},
		templates = {
			folder = "Templates",
			date_format = "%m-%d-%Y",
		},
		ui = { enable = false },
	},
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				vim.opt_local.foldmethod = "expr"
				vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
				vim.opt_local.foldenable = true
				vim.opt_local.foldlevel = 1
				vim.opt_local.foldlevelstart = 1
				vim.opt_local.foldcolumn = "1"
			end,
		})
	end,
}

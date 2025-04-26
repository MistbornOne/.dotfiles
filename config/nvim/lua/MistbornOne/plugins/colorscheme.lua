return {
	{
		"catppuccin/nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				-- transparent_background = true,
				background = {
					dark = "mocha",
					light = "frappe",
				},
				integrations = {
					treesitter = true,
					nvimtree = true,
					alpha = true,
					mason = true,
					which_key = true,
					telescope = {
						enabled = true,
					},
				},
			}) -- <-- CLOSE the setup() here!

			-- now load the colorscheme separately
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}

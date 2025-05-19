return {
	{
		"catppuccin/nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				styles = {
					keywords = { "italic" },
					comments = { "italic" },
				},
				transparent_background = true,
				custom_highlights = {
					Type = { fg = "#8C9440" },
					String = { fg = "#B5BD67" },
					Constant = { fg = "#f38ba8" },
					Boolean = { fg = "#f4b8e4" },
					Number = { fg = "#e5c890" },
					["@function.builtin"] = { fg = "#ed8796" },
					["@markup.heading.1.markdown"] = { fg = "#74c7ec" },
					["@markup.heading.2.markdown"] = { fg = "#f4b8e4" },
				},

				integrations = {
					treesitter = true,
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					alpha = true,
					mason = true,
					which_key = true,
					telescope = {
						enabled = true,
					},
				},
			})

			-- now load the colorscheme separately
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}

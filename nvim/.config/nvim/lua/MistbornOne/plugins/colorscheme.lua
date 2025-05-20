return {
	{
		"catppuccin/nvim",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				styles = {
					keywords = { "italic" },
					comments = { "italic" },
				},
				transparent_background = true,

				custom_highlights = {
					-- Nord-inspired palette
					Comment = { fg = "#616E88" }, -- nord3
					Keyword = { fg = "#81A1C1", italic = true }, -- nord9
					Function = { fg = "#88C0D0" }, -- nord8
					String = { fg = "#A3BE8C" }, -- nord14
					Number = { fg = "#B48EAD" }, -- nord15
					Boolean = { fg = "#f4b8e4" }, -- nord11
					Type = { fg = "#8FBCBB" }, -- nord7
					Constant = { fg = "#A6ADC8" }, -- catppuccin mocha subtext 0
					LineNr = { fg = "#4C566A" }, -- dim grey (nord3)
					CursorLineNr = { fg = "#88C0D0", bold = true }, -- nord8
					CursorLine = { bg = "#2E3440" }, -- soft nord0 backgroun
					["@function.builtin"] = { fg = "#F38BA8" }, -- nord9
					["@variable"] = { fg = "#BAC2DE" }, -- catppuccin mocha subtext 1
					["@markup.heading.1.markdown"] = { fg = "#CBA6F7", bold = true }, -- catppuccin mocha mauve
					["@markup.heading.2.markdown"] = { fg = "#A3BE8C", bold = true }, -- nord14
					["@markup.heading.3.markdown"] = { fg = "#EBA0AC", bold = true }, -- catppuccin mocha maroon
					["@markup.heading.4.markdown"] = { fg = "#88C0D0", bold = true }, -- nord8
					["@markup.strong.markdown_inline"] = { fg = "#F4B8E4", bold = true }, -- catppuccin mocha pink
					["@markup.italic.markdown_inline"] = { fg = "#F4B8E4", italic = true }, -- catppuccin mocha pink
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

			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}

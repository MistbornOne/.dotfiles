return {
	{
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

			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
		},
		config = function(plugin, opts)
			require("obsidian").setup(opts)

			-- Custom folds (optional logic)
			vim.api.nvim_create_autocmd("BufWinEnter", {
				pattern = "*.md",
				callback = function()
					local path = vim.fn.expand("%:p")
					local home = vim.fn.expand("~")
					local target_dir = home .. "/Documents/Obsidian/Work/Meetings/1:1/"

					if path:find(target_dir, 1, true) then
						vim.opt_local.foldmethod = "manual"
						vim.opt_local.foldenable = true
						vim.opt_local.foldcolumn = "1"

						vim.defer_fn(function()
							local bufnr = vim.api.nvim_get_current_buf()
							local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
							local folds = {}

							for i, line in ipairs(lines) do
								if line:match("^## ") then
									table.insert(folds, i)
								end
							end

							for j = 1, #folds do
								local start = folds[j]
								local finish = folds[j + 1] and (folds[j + 1] - 1) or (#lines - 1)
								vim.cmd(start .. "," .. finish .. "fold")
							end
						end, 50)
					end
				end,
			})
		end,
	},
}

return {
	{
		dir = "~/dev/github/MistbornOne/projects/nvim-plugins/better-tasks/",
		name = "better-tasks",
		config = function()
			require("better-tasks").setup({
				categories = { "Coding", "Notes", "Life", "Work" },
				master_file = vim.fn.expand("~/Documents/Obsidian/Tasks/master_tasks.md"),
				archive_file = vim.fn.expand("~/Documents/Obsidian/Tasks/archive.md"),
			})
		end,
	},
}

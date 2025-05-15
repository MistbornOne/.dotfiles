return {
	{
		dir = "~/dev/github/MistbornOne/projects/nvim-plugins/better-tasks/",
		name = "better-tasks",
		config = function()
			require("better-tasks").setup({
				categories = { "Coding", "Notes", "Life", "Work" },
			})
		end,
	},
}

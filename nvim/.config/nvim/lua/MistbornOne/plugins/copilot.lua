return {
	"github/copilot.vim",
	lazy = false, -- Load on startup
	config = function()
		vim.g.copilot_no_tab_map = false
		vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
	end,
}

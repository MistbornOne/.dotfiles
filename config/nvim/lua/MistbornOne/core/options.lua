vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = true -- enable or disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- Create Obsidian note command (alternative implementation)
vim.api.nvim_create_user_command("ObsidianInbox", function(opts)
	local args = opts.args ~= "" and opts.args or ""
	local script_path = vim.fn.expand("$HOME") .. "/dev/github/MistbornOne/projects/scripts/obsidian-new.py"

	-- Use vim.fn.jobstart for better control
	vim.fn.jobstart({ "python3", script_path, args }, {
		on_exit = function(_, exit_code)
			if exit_code ~= 0 then
				vim.api.nvim_err_writeln("Error running Obsidian inbox script")
			end
		end,
		-- Use the nvim buffer for stdio
		stdout_buffered = true,
		stderr_buffered = true,
	})
end, { nargs = "?", desc = "Create new Obsidian inbox note" })

-- Set folder icon color
-- Re-apply nvim-tree folder highlight after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.cmd([[
      highlight NvimTreeFolderIcon guifg=#cba6f7
      highlight NvimTreeFolderName guifg=#cba6f7
      highlight NvimTreeOpenedFolderName guifg=#cba6f7
      highlight NvimTreeFolderArrowOpen guifg=#a6e3a1
      highlight NvimTreeFolderArrowClosed guifg=#f2cdcd
    ]])
	end,
})

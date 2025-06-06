-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "JK", "<ESC>", { desc = "Exit insert mode with jk" })

-- use jk to exit visual mode
keymap.set("v", "jk", "<ESC>", { desc = "Exit visual mode with jk" })
keymap.set("v", "JK", "<ESC>", { desc = "Exit visual mode with jk" })

-- save and quit
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Save and Quit" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- folds

keymap.set("n", "<leader>z", "za", { desc = "Toggle fold under cursor" })
keymap.set("n", "<leader>zo", "zO", { desc = "Open nested folds under cursor" })
keymap.set("n", "<leader>zc", "zC", { desc = "Close nested folds under cursor" })
keymap.set("n", "<leader>zr", "zR", { desc = "Open all folds" })
keymap.set("n", "<leader>zm", "zM", { desc = "Close all folds" })
keymap.set("n", "<leader>zx", "zx", { desc = "Recalculate folds" })
keymap.set("n", "<leader>zf", ":set foldenable!<CR>", { desc = "Toggle folding on/off", silent = true })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>sl", "<C-w>h", { desc = "Move left one window" }) -- move to the left window
keymap.set("n", "<leader>sr", "<C-w>l", { desc = "Move right one window" }) -- move to the right window
keymap.set("n", "<leader>sk", "<C-w>k", { desc = "Move up one window" }) -- move up one window
keymap.set("n", "<leader>sj", "<C-w>j", { desc = "Move down one window" }) -- move down one window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- title program
-- For normal mode: convert current line
vim.api.nvim_set_keymap(
	"n",
	"<leader>ti",
	":.!'/Users/ianwatkins/scripts/title/'<CR>",
	{ noremap = true, silent = true }
)

-- Bold title case on current line
vim.api.nvim_set_keymap(
	"n",
	"<leader>tb",
	":.!sh -c '\"/Users/ianwatkins/scripts/title\" -b'<CR>",
	{ noremap = true, silent = true }
)

-- H2 heading title case on current line
vim.api.nvim_set_keymap(
	"n",
	"<leader>th",
	":.!sh -c '\"/Users/ianwatkins/scripts/title\" -h=2'<CR>",
	{ noremap = true, silent = true }
)

-- For visual mode: convert selected text
vim.api.nvim_set_keymap(
	"v",
	"<leader>ti",
	":!'/Users/ianwatkins/dev/github/MistbornOne/projects/programs/title'<CR>",
	{ noremap = true, silent = true }
)

-- Obsidian inbox note keymap
vim.keymap.set("n", "<leader>on", function()
	-- Prompt for note title
	local title = vim.fn.input("Note title: ")
	if title ~= "" then
		vim.cmd("ObsidianInbox " .. title)
	else
		vim.cmd("ObsidianInbox")
	end
end, { desc = "Create new Obsidian note" })

-- Alternative without prompt (if you prefer to pass the title as command args)
vim.keymap.set("n", "<leader>oN", ":ObsidianInbox ", { desc = "Create Obsidian note with title" })

-- Copilot keymaps
vim.keymap.set("n", "<leader>cd", "<cmd>Copilot disable<CR>", { desc = "Disable Copilot" })
vim.keymap.set("n", "<leader>ce", "<cmd>Copilot enable<CR>", { desc = "Enable Copilot" })

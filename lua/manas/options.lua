local opt = vim.opt

-----------------------------------------------------------
-- File and Buffer Settings
-----------------------------------------------------------
opt.encoding = "utf-8" -- Set the default file encoding
opt.fileencoding = "utf-8" -- Set the encoding for the file itself
opt.clipboard = "unnamedplus" -- Use the system clipboard for copy/paste
opt.swapfile = false -- Don't create a swapfile for this session
opt.backup = false -- Don't create a backup file
opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Set a persistent undo directory
opt.undofile = true -- Enable persistent undo
opt.hidden = true -- Allow switching buffers without saving

-----------------------------------------------------------
-- Appearance and UI 💅
-----------------------------------------------------------
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers for easier navigation
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.signcolumn = "yes" -- Always show the sign column to prevent layout shifts
opt.scrolloff = 8 -- Keep the cursor 8 lines away from the top/bottom of the screen
opt.sidescrolloff = 8 -- Keep the cursor 8 columns away from the sides
opt.wrap = false -- Disable line wrapping
opt.splitright = true -- New vertical splits will appear on the right
opt.splitbelow = true -- New horizontal splits will appear below
opt.cursorline = true -- Highlight the current line
opt.pumheight = 10 -- Set the maximum height of the popup menu

-----------------------------------------------------------
-- Search Settings 🔍
-----------------------------------------------------------
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Override ignorecase if the search pattern has uppercase letters
opt.hlsearch = true -- Highlight all search matches
opt.incsearch = true -- Show search matches incrementally as you type

-----------------------------------------------------------
-- Text Editing and Formatting
-----------------------------------------------------------
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 2 -- Number of spaces a tab counts for
opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
opt.smartindent = true -- Automatically insert indentation in certain situations
opt.breakindent = true -- Preserve indentation for wrapped lines

-----------------------------------------------------------
-- Diagnostic display inline
-----------------------------------------------------------
vim.diagnostic.config({
  virtual_text = true,
  underline = true
})


---- forked from kickstart
vim.o.confirm = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-----------------------------------------------------------
-- Hightlight yank
-----------------------------------------------------------
vim.api.nvim_create_autocmd("textyankpost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "highlight selection on yank",
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '󰌵',
    },
  }
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-----------------------------
---General Keymaps
-----------------------------

map("i", "jj", "<ESC>", { desc = "Exit insert mode with jk" }, opts)

--- Clear search highlights
map("n", "<leader><space>", ":nohlsearch<CR>", { desc = "Clear search highlights" }, opts)

--- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Navigate window left" }, opts)
map("n", "<C-j>", "<C-w>j", { desc = "Navigate window down" }, opts)
map("n", "<C-k>", "<C-w>k", { desc = "Navigate window up" }, opts)
map("n", "<C-l>", "<C-w>l", { desc = "Navigate window right" }, opts)

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", { desc = "Go to next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Go to previous buffer" })


-- Close buffer
map("n", "<C-w>", ":bdelete<CR>", { desc = "Close current buffer" })

-- Save buffer
map("n", "<C-s>", ":w<CR>", { desc = "Save buffer" })

-- lsp keymaps
vim.api.nvim_create_autocmd(
	"LspAttach",
	{ --  Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)

			-- Open the diagnostic under the cursor in a float window
			vim.keymap.set("n", "<leader>d", function()
				vim.diagnostic.open_float({
					border = "rounded",
				})
			end, opts)
		end,
	}
)

-- Neotree keymaps
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>')

-- Vsplit keymap
vim.keymap.set('n', '<leader>]', ':vsplit<CR>')



-- Toogle terminal


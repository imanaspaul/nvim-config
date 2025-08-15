vim.g.mapleader = " "
vim.g.maplocalleader = " "

--- Lazy.nvim package manager for plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
------------------------------------------

require("manas.options")
require("manas.keymaps")


require("lazy").setup("manas.plugins")

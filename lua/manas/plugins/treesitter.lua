return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "javascript", "typescript", "tsx", "go", "lua", "json", "prisma", "html", "css", "gomod", "scss" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
            },
        })
    end,
}

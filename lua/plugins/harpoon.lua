return {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("harpoon").setup()
    end
}

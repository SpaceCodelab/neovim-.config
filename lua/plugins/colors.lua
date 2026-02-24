return {
    --[[{
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_foreground = "original"
            vim.g.gruvbox_material_dim_inactive_warnings = true
            vim.g.gruvbox_material_enable_bold = true
            vim.g.gruvbox_material_dim = true

            vim.cmd("colorscheme gruvbox-material")
        end,
    },]]
    {
        "water-sucks/darkrose.nvim",
        priority = 1000,
        config = function()
            vim.g.darkrose_high_visibility = true
            vim.g.darkrose_bold_keywords = true
            vim.g.darkrose_italic_comments = true
            vim.g.darkrose_italic_strings = false
            vim.g.darkrose_transparent_background = false
            vim.cmd("colorscheme darkrose")
        end,
    },
    --[[{
        "metalelf0/jellybeans-nvim",
        priority = 1000,
        config = function()
            vim.g.jellybeans_overrides = {
                background = "101010",
            }
            vim.cmd("colorscheme jellybeans")
        end,
    },]]

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = 'auto',
        }
    },
}

return {
    {
        "sainnhe/gruvbox-material",
        priority = 1000,
        config = function()
            -- set colorscheme

            -- optional preferred style
            -- vim.o.background = "dark"    -- (darkest variant)
            vim.g.gruvbox_material_background = "hard" -- soft / medium / hard
            vim.g.gruvbox_material_foreground = "original"
            vim.g.gruvbox_material_sign_column_background = "none"

            vim.g.gruvbox_material_enable_bold = true
            vim.g.gruvbox_material_enable_italic = true

            vim.cmd("colorscheme gruvbox-material")
        end,
    },
    --[[{
        "Shatur/neovim-ayu",
        priority = 1000, -- load before everything
        config = function()
            -- ayu style: dark | mirage | light
            vim.g.ayucolor = "dark"

            -- optional tweaks
            vim.g.ayu_extended_palette = true
            vim.g.ayu_mirage = false

            vim.g.ayu_disable_italic = false
            vim.g.ayu_disable_bold = false

            vim.cmd.colorscheme("ayu")
        end,
    },]]

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = 'gruvbox-material',
        }
    },
}

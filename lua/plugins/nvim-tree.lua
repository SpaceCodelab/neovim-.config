return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('nvim-tree').setup({
            view = {
                width = 35,
            },
            renderer = {
                indent_markers = {
                    enable = true,
                },
                highlight_git = true,
                icons = {
                    show = {
                        git = true,
                    },
                },
            },
            filters = {
                dotfiles = false,
                git_ignored = false,
            },
        })

        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle nvim-tree' })
        vim.keymap.set('n', '<leader>o', ':NvimTreeFocus<CR>', { desc = 'Focus nvim-tree' })

        vim.keymap.set('n', '<leader>+', ':NvimTreeResize +5<CR>', { desc = 'Increase tree width' })
        vim.keymap.set('n', '<leader>-', ':NvimTreeResize -5<CR>', { desc = 'Decrease tree width' })
    end,
}

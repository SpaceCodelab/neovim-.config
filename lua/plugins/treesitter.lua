return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.config').setup({
            ensure_installed = {
                'c', 'cpp', 'rust', 'python', 'lua',
                'vim', 'vimdoc', 'query',
                'markdown', 'markdown_inline',
                'json', 'yaml', 'toml',
                'bash', 'diff', 'gitcommit',
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<leader>ss',
                    node_incremental = '<leader>si',
                    node_decremental = '<leader>sd',
                    scope_incremental = '<leader>sc',
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        [']]'] = '@function.outer',
                        [']m'] = '@class.outer',
                    },
                    goto_previous_start = {
                        ['[['] = '@function.outer',
                        ['[m'] = '@class.outer',
                    },
                },
            },
        })
    end,
}

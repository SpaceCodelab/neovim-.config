return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
        'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
        local actions = require('telescope.actions')
        local action_layout = require('telescope.actions.layout')

        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ['<C-k>'] = actions.move_selection_previous,
                        ['<C-j>'] = actions.move_selection_next,
                        ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
                        ['<C-l>'] = action_layout.toggle_preview,
                    },
                },
                file_ignore_patterns = {
                    'node_modules',
                    '.git/',
                    '.venv',
                    '__pycache__',
                    'target/',
                    'build/',
                    'dist/',
                },
                hidden = true,
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    additional_args = { '--hidden' },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case',
                },
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown({}),
                },
            },
        })

        require('telescope').load_extension('fzf')
        require('telescope').load_extension('ui-select')

        local builtin = require('telescope.builtin')

        -- Files
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Find old files' })
        vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Resume last picker' })
        vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'Quickfix list' })
        vim.keymap.set('n', '<leader>fi', function()
            builtin.find_files({ cwd = '~/.config/nvim/' })
        end, { desc = 'Find in nvim config' })

        -- Text search
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
        vim.keymap.set('n', '<leader>fs', function()
            builtin.grep_string({ search = vim.fn.expand('<cword>') })
        end, { desc = 'Grep word under cursor' })

        -- Git
        vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Git files' })
        vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
        vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })

        -- Buffers / Help
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })

        -- LSP
        vim.keymap.set('n', '<leader>sr', builtin.lsp_references, { desc = 'LSP references' })
        vim.keymap.set('n', '<leader>sd', builtin.lsp_document_symbols, { desc = 'Document symbols' })
        vim.keymap.set('n', '<leader>sw', builtin.lsp_workspace_symbols, { desc = 'Workspace symbols' })
        vim.keymap.set('n', '<leader>si', builtin.lsp_implementations, { desc = 'LSP implementations' })

        -- Diagnostics
        vim.keymap.set('n', '<leader>dd', builtin.diagnostics, { desc = 'Document diagnostics' })
    end,
}

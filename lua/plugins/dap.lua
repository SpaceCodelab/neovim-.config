return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
        'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        dapui.setup({})

        require('nvim-dap-virtual-text').setup()

        dap.adapters.codelldb = {
            type = 'server',
            port = '${port}',
            executable = {
                command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
                args = { '--port', '${port}' },
            },
        }

        dap.configurations.c = {
            {
                name = 'Launch file',
                type = 'codelldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            },
        }
        dap.configurations.cpp = dap.configurations.c

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.after.event_terminated['dapui_config'] = dapui.close
        dap.listeners.after.event_exited['dapui_config'] = dapui.close

        vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Continue/Start' })
        vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug: Step over' })
        vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step into' })
        vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Debug: Step out' })
        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle breakpoint' })
        vim.keymap.set('n', '<leader>dB', function()
            dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end, { desc = 'Debug: Conditional breakpoint' })
        vim.keymap.set('n', '<leader>dc', dap.run_to_cursor, { desc = 'Debug: Run to cursor' })
        vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Debug: Toggle UI' })
        vim.keymap.set('n', '<leader>dr', dap.restart, { desc = 'Debug: Restart' })
        vim.keymap.set('n', '<leader>dq', dap.terminate, { desc = 'Debug: Terminate' })
    end,
}

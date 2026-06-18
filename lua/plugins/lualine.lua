return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            theme = 'auto',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            globalstatus = true,
            icons_enabled = true,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = {
                { 'branch', icon = '⎇' },
                {
                    'diff',
                    symbols = { added = '+ ', modified = '~ ', removed = '- ' },
                },
            },
            lualine_c = {
                { 'filename', path = 1 },
                { 'fileformat' },
                { 'encoding' },
                { 'filetype', icon_only = true },
                { 'filesize' },
            },
            lualine_x = {
                { 'datetime', style = '%H:%M:%S' },
                { 'hostname' },
            },
            lualine_y = {
                {
                    'diagnostics',
                    sources = { 'nvim_lsp' },
                    symbols = { error = '✘ ', warn = '▲ ', info = '⚑ ', hint = '» ' },
                },
                { 'searchcount' },
                { 'selectioncount' },
            },
            lualine_z = {
                { 'location' },
                { 'progress' },
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {},
        },
        extensions = {
            'nvim-tree',
            'fugitive',
            'mason',
            'lazy',
        },
    },
}

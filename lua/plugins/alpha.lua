--[[
--this is the main start screen of nvim but i am disabling it because i want something minimalistic
--and you can always edit this script according to yourself......
--
---@diagnostic disable: undefined-global

return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- =========================
        -- Doom Emacs–style header
        -- =========================
        dashboard.section.header.val = {
            "=================     ===============     ===============   ========  ========",
            "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
            "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
            "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
            "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
            "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
            "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
            "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
            "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
            "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
            "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
            "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
            "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
            "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_    |  \\/  |   ||",
            "||   .=='    _-'            `=_ _-'           `-_ _='            `-_ \\  |   ||",
            "||.=='    _-'                                                     `-_ `=_|   ||",
            "=='    _-'                                                             `-_`==",
            "",
            "                              DOOM • NEOVIM • ARCH",
            "",
        }

        -- =========================
        -- Buttons (Doom-style)
        -- =========================
        dashboard.section.buttons.val = {
            dashboard.button("e", "󰈔  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "󰱼  Find file", ":Telescope find_files <CR>"),
            dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
            dashboard.button("g", "󰊢  Git status", ":Telescope git_status <CR>"),
            dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua <CR>"),
            dashboard.button("q", "󰅚  Quit", ":qa <CR>"),
        }

        -- =========================
        -- Footer
        -- =========================
        dashboard.section.footer.val = {
            "",
            "The right editor is the one you control.",
        }

        -- =========================
        -- Highlights (Doom-ish)
        -- =========================
        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#51afef" })  -- Doom blue
        vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#c678dd" }) -- Doom purple
        vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#5b6268" })  -- Doom gray

        dashboard.section.header.opts.hl  = "AlphaHeader"
        dashboard.section.buttons.opts.hl = "AlphaButtons"
        dashboard.section.footer.opts.hl  = "AlphaFooter"

        -- =========================
        -- Layout
        -- =========================
        dashboard.config.layout           = {
            { type = "padding", val = 2 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 2 },
            dashboard.section.footer,
        }

        dashboard.config.opts.noautocmd   = true
        alpha.setup(dashboard.config)
    end,
}
]]

return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Centered Doom-style ASCII: NEOVIM
        dashboard.section.header.val = {
            "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
            "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
            "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
            "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
            "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
            "",
            "              	Raman's Vim",
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "󰈔  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "󰱼  Find file", ":Telescope find_files <CR>"),
            dashboard.button("r", "󰄉  Recent files", ":Telescope oldfiles <CR>"),
            dashboard.button("g", "󰊢  Git status", ":Telescope git_status <CR>"),
            dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua <CR>"),
            dashboard.button("q", "󰅚  Quit", ":qa <CR>"),
        }

        dashboard.section.footer.val = {
            "",
            "minimal • fast • focused",
        }

        -- Dynamic vertical centering
        local function center_padding()
            local height = vim.fn.winheight(0)
            return math.floor(height * 0.25)
        end

        dashboard.config.layout = {
            { type = "padding", val = center_padding() },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 2 },
            dashboard.section.footer,
        }



        dashboard.config.opts.noautocmd = true
        -- Pale yellow header (Gruvbox-friendly)
        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#bb7744" })
        dashboard.section.header.opts.hl = "AlphaHeader"

        alpha.setup(dashboard.config)
    end,
}

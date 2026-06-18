return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-web-devicons",
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local function button(sc, txt, keybind)
            local b = dashboard.button(sc, txt)
            b.opts.hl = "AlphaButtons"
            b.opts.hl_shortcut = "AlphaShortcut"
            if keybind then
                b.opts.keymap = { "n", sc, keybind, { noremap = true, silent = true } }
            end
            return b
        end

        dashboard.section.header.val = {
            "",
            "          .  .                .  .          ",
            "        ( O O )            ( O O )          ",
            "       .( === ).          .( === ).         ",
            "        '-----'-----.-----'-----'           ",
            "                     |                      ",
            "                   -----                    ",
            "                  | ᗑ   |                   ",
            "                   -----                    ",
            "                   /   \\                    ",
            "                  /     \\                   ",
            "                 / _____/                   ",
            "                /_/                         ",
            "",
            "       ~ You're a wizard, Neovimer ~        ",
            "",
        }

        dashboard.section.buttons.val = {
            button("e", "  Alohomora!       New File",      ":ene <BAR> startinsert<CR>"),
            button("f", "  Accio File!      Find File",     ":Telescope find_files<CR>"),
            button("r", "  Prior Incantato   Recent Files", ":Telescope oldfiles<CR>"),
            button("g", "  Legilimens!      Live Grep",     ":Telescope live_grep<CR>"),
            button("c", "  Chamber           Config",       ":e $MYVIMRC<CR>"),
            button("q", "  Avada Kedavra!   Quit",          ":qa<CR>"),
        }

        local quotes = {
            "\"It does not do to dwell on dreams and forget to live.\"  — Dumbledore",
            "\"Words are, in our most inexhaustible source of magic.\"  — Dumbledore",
            "\"Happiness can be found even in the darkest of times, if one only remembers to turn on the light.\"  — Dumbledore",
            "\"I solemnly swear that I am up to no good.\"  — The Marauder's Map",
            "\"Mischief managed.\"  — The Marauder's Map",
            "\"After all this time?  Always.\"  — Snape",
            "\"Do not pity the dead, Harry. Pity the living.\"  — Dumbledore",
            "\"Nitwit! Blubber! Oddment! Tweak!\"  — Dumbledore",
            "\"To the well-organized mind, death is but the next great adventure.\"  — Dumbledore",
        }

        math.randomseed(os.time())
        local quote = quotes[math.random(#quotes)]

        local function wrap(s, width)
            local lines = {}
            local line = ""
            for word in s:gmatch("%S+") do
                if #line + #word + 1 > width then
                    table.insert(lines, line)
                    line = word
                else
                    line = line == "" and word or (line .. " " .. word)
                end
            end
            if line ~= "" then table.insert(lines, line) end
            return lines
        end

        local function setup_alpha()
            local total_lines = #dashboard.section.header.val + #dashboard.section.buttons.val + 3
            local top = math.max(0, math.floor((vim.o.lines - total_lines) / 5))

            local footer_lines = wrap(quote, 64)
            table.insert(footer_lines, 1, "")
            table.insert(footer_lines, 1, "──────────────────────────────────────────────────────────────────")
            table.insert(footer_lines, "")

            local ok, stats = pcall(function()
                return require("lazy").stats()
            end)
            if ok and stats then
                table.insert(footer_lines, string.format("  ⚡ %d spells loaded in %.0f ms", stats.count, stats.startuptime))
            end

            dashboard.section.footer.val = footer_lines

            dashboard.config.layout = {
                { type = "padding", val = top },
                dashboard.section.header,
                { type = "padding", val = 2 },
                dashboard.section.buttons,
                { type = "padding", val = 1 },
                dashboard.section.footer,
            }

            vim.api.nvim_set_hl(0, "AlphaHeader",   { fg = "#FFD700", bold = true })
            vim.api.nvim_set_hl(0, "AlphaButtons",  { fg = "#C0C0C0" })
            vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#AE0001", bold = true })
            vim.api.nvim_set_hl(0, "AlphaFooter",   { fg = "#6272a4", italic = true })

            alpha.setup(dashboard.config)
            alpha.redraw()
        end

        setup_alpha()

        vim.api.nvim_create_autocmd("VimResized", {
            group = vim.api.nvim_create_augroup("alpha_center", { clear = true }),
            callback = setup_alpha,
        })
    end,
}

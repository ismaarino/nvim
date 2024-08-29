local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

math.randomseed(os.time())

function getEmogi()
    local strings = {
        "(┛ಠДಠ)┛彡┻━┻" ,
        "“The best error message is the one that never shows up.“",
        "“It’s not a bug - it’s an undocumented feature.“",
        "“Code never lies, comments sometimes do.”",
        "“It works on my machine!”",
        "“There’s no place like 127.0.0.1”",
        "“Sometimes the best way to solve a problem is to go get a cup of coffee and let the problem sit for a while.”",
        "“Why do programmers prefer dark mode? Because light attracts bugs.”",
    }
    local length = #strings
    local randomIndex = math.random(1, length)
    return strings[randomIndex]
end

-- Set header
dashboard.section.header.val = {
    "                                        ",
    "                                        ",
    "                                        ",
    "                                        ",
    "▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄",
    "██░▀██░██░▄▄▄██░▄▄▄░██░███░█▄░▄██░▄▀▄░██",
    "██░█░█░██░▄▄▄██░███░███░█░███░███░█░█░██",
    "██░██▄░██░▀▀▀██░▀▀▀░███▄▀▄██▀░▀██░███░██",
    "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀",
    "                                        ",
    "                                        ",
}

-- Set menu
dashboard.section.buttons.val = {}

dashboard.section.footer.val = {
    getEmogi(),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

local hotkey = require 'hs.hotkey'
local application = require 'hs.application'

------------- Switch to Application ---------------{{{
local key2App = {
    c = 'AppCleaner',
    e = 'Evernote',
    --h = 'iTerm',
    j = 'Google Chrome',
    m = 'Finder',
    n = 'NeteaseMusic',
    o = 'OmniFocus',
    p = '1Password',
    r = 'Reeder',
    z = 'Dictionary',
    w = 'MacDown'
}

for key, app in pairs(key2App) do
    hotkey.bind(hyper, key, function() 
        application.launchOrFocus(app) 
    end)
end

-- hammerspoon console
--hotkey.bind(hyper, ';', hs.openConsole)

-- iTerm console
hotkey.bind(hyper, ';', function()
    application.launchOrFocus("iTerm")
end)

-- reload
hotkey.bind(hyper, 'escape', function() hs.reload() end )
-- }}}

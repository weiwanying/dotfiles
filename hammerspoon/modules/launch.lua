local hotkey = require 'hs.hotkey'
local application = require 'hs.application'
local itunes = require 'hs.itunes'

-- {{{ switch to application
-- hs.keycodes.map(http://www.hammerspoon.org/docs/hs.keycodes.html#map)
local key2app = {
    a = 'AppCleaner',
    b = 'Notes',
    c = 'Calendar',
    -- d, (system hotkey) Ctrl + Cmd + d => define word
    e = 'Evernote',
    f = 'Finder',
    g = 'Mail',
    h = 'Dash',
    i = 'iTunes',
    j = 'Google Chrome',
    k = 'Preview',
    l = 'Dictionary',
    m = 'MacDown',
    n = 'NeteaseMusic',
    o = 'OmniFocus',
    p = '1Password',
    q = 'App Store',
    r = 'Reeder',
    s = 'System Preferences',
    t = 'Tweetbot',
    u = 'Ulysses',
    v = 'Parallels Desktop',
    w = 'WeChat',
    x = 'Papers',
    y = 'Messages',
    z = 'Sublime Text',
}

for key, app in pairs(key2app) do
    hotkey.bind(hyper, key, function()
        toggle_application(app)
    end)
end

-- hammerspoon console
--hotkey.bind(hyper, ';', hs.openConsole)

-- iTerm2 console
hotkey.bind(hyper, ';', function()
    toggle_application("iTerm")
end)

--hotkey.bind(hyper, "'", function()
--end)

-- {{{ iTunes console
hotkey.bind(hyperShift, 'space', function() hs.itunes.playpause() end)
hotkey.bind(hyperShift, 'n', function() hs.itunes.next() end)
hotkey.bind(hyperShift, 'p', function() hs.itunes.previous() end)
-- }}}

-- reload
hotkey.bind(hyper, 'escape', function() hs.reload() end)

--}}}
-- {{{ toggle_application
-- Toggle an application between being the frontmost app, and being hidden
function toggle_application(_app)
    -- Finds running applications
    local app = application.find(_app)

    if not app then
        --application.launchOrFocus(_app)
        application.open(_app)
        return
    end

    -- application is running, toggle hide/unhide
    local mainwin = app:mainWindow()
    if mainwin then
        if true == app:isFrontmost() then
            mainwin:application():hide()
        else
            mainwin:application():activate(true)
            mainwin:application():unhide()
            mainwin:focus()
        end
    else
        application.launchOrFocus(_app)
    end
end
-- }}}

------------- Set hyper to ctrl + cmd ---------------
local hyper = {'ctrl', 'cmd'}
local hyperShift = {'ctrl', 'cmd', 'shift'}

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
    u = 'Day One Helper',
    z = 'Dictionary',
    w = 'MacDown'
}

for key, app in pairs(key2App) do
    hs.hotkey.bind(hyper, key, function() 
        hs.application.launchOrFocus(app) 
    end)
end

-- hammerspoon console
--hs.hotkey.bind(hyper, ';', hs.openConsole)

-- iTerm console
hs.hotkey.bind(hyper, ';', function()
    hs.application.launchOrFocus("iTerm")
end)

-- reload
hs.hotkey.bind(hyper, 'escape', function() hs.reload() end )

-- }}}

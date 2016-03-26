
-- Hammerspoon --
-- http://www.hammerspoon.org/ --
-- http://larryhynes.net/2015/02/switching-from-slate-to-hammerspoon.html
--

------------- Sset hyper to ctrl + cmd ---------------
local hyper = {'ctrl', 'cmd'}
local hyperShift = {'ctrl', 'cmd', 'shift'}

-- make window transitions much snappier
hs.window.animationDuration = 0

------------- Reload config after write ---------------
-- pathwatcher will automatically reload the config whenever the file changes
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()
hs.alert.show("Hammerspoon Config loaded")

------------- Switch to Application ---------------{{{
-- App shortcuts
local key2App = {
    c = 'AppCleaner',
    e = 'Evernote',
    f = 'Finder',
    n = 'NeteaseMusic',
    o = 'OmniFocus',
    p = '1Password',
    q = 'QQ',
    r = 'Reeder',
    t = 'iTerm',
    w = 'Google Chrome'
}

for key, app in pairs(key2App) do
    hs.hotkey.bind(hyperShift, key, function() 
        hs.application.launchOrFocus(app) 
    end)
end
-- }}}

------------- Window Management --------------- {{{
-- hyper d for left one half window
hs.hotkey.bind(hyper, 'd', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-- hyper g for right one half window
hs.hotkey.bind(hyper, 'g', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 2)
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-- hyper f for fullscreen
hs.hotkey.bind(hyper, 'f', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w
        f.h = max.h
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-- hyper r for top left one quarter window
hs.hotkey.bind(hyper, 'r', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)


-- hyper t for top right one quarter window
hs.hotkey.bind(hyper, 't', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 2)
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-- hyper v for bottom left one quarter window
hs.hotkey.bind(hyper, 'v', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 2)
        f.y = max.y + (max.h / 2)
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)


-- hyper c for bottom right one quarter window
hs.hotkey.bind(hyper, 'c', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y + (max.h / 2)
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-- Hyper i to show window hints
hs.hotkey.bind(hyper, 'i', function() 
    hs.hints.windowHints() 
end)

-- Hyper hjkl to switch window focus
hs.hotkey.bind(hyper, 'k', function()
    if hs.window.focusedWindow() then
        hs.window.focusedWindow():focusWindowNorth()
    else
        hs.alert.show("No active window")
    end
end)

hs.hotkey.bind(hyper, 'j', function()
    if hs.window.focusedWindow() then
        hs.window.focusedWindow():focusWindowSouth()
    else
        hs.alert.show("No active window")
    end
end)

hs.hotkey.bind(hyper, 'l', function()
    if hs.window.focusedWindow() then
        hs.window.focusedWindow():focusWindowEast()
    else
        hs.alert.show("No active window")
    end
end)

hs.hotkey.bind(hyper, 'h', function()
    if hs.window.focusedWindow() then
        hs.window.focusedWindow():focusWindowWest()
    else
        hs.alert.show("No active window")
    end
end)

--}}}

------------- Multiple Monitor Management --------------- {{{
-- hyper + left move the current window to the left monitor
hs.hotkey.bind(hyper, 'left', function() 
    local w = hs.window.focusedWindow()
    if not w then 
        return
    end
    local s = w:screen():toWest()
    if s then
        w:moveToScreen(s)
    end
end)

-- hyper + right move the current window to the right monitor
hs.hotkey.bind(hyper, 'right', function() 
    local w = hs.window.focusedWindow()
    if not w then 
        return
    end
    local s = w:screen():toEast()
    if s then
        w:moveToScreen(s)
    end
end)

-- }}}

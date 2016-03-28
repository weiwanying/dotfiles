-- Hammerspoon --
-- http://larryhynes.net/2015/02/switching-from-slate-to-hammerspoon.html
-- https://github.com/cmsj/hammerspoon-config

require "hs.application"
------------- Set hyper to ctrl + cmd ---------------
local hyper = {'ctrl', 'cmd'}
local hyperShift = {'ctrl', 'cmd', 'shift'}

-- make window transitions much snappier
-- The default duration for animations, in seconds. 
-- Initial value is 0.2; set to 0 to disable animations.
hs.window.animationDuration = 0

------------- Window Management --------------- {{{
---- hyper d for left one half window
hs.hotkey.bind(hyper, 'd', function() hs.window.focusedWindow():moveToUnit(hs.layout.left50) end)
--hs.hotkey.bind(hyper, 'd', function()
--    if hs.window.focusedWindow() then
--        local win = hs.window.focusedWindow()
--        local f = win:frame()
--        local screen = win:screen()
--        local max = screen:frame()
--
--        f.x = max.x
--        f.y = max.y
--        f.w = max.w / 2
--        f.h = max.h
--        win:setFrame(f)
--    else
--        hs.alert.show("No active window")
--    end
--end)

-- hyper g for right one half window
hs.hotkey.bind(hyper, 'g', function() hs.window.focusedWindow():moveToUnit(hs.layout.right50) end)
--hs.hotkey.bind(hyper, 'g', function()
--    if hs.window.focusedWindow() then
--        local win = hs.window.focusedWindow()
--        local f = win:frame()
--        local screen = win:screen()
--        local max = screen:frame()
--
--        f.x = max.x + (max.w / 2)
--        f.y = max.y
--        f.w = max.w / 2
--        f.h = max.h
--        win:setFrame(f)
--    else
--        hs.alert.show("No active window")
--    end
--end)

-- hyper f for fullscreen
--hs.hotkey.bind(hyper, 'f', function() hs.window.focusedWindow():toggleFullScreen() end)
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

-- Hotkeys to resize windows absolutely
hs.hotkey.bind(hyper, '[', function() hs.window.focusedWindow():moveToUnit(hs.layout.left30) end)
hs.hotkey.bind(hyper, ']', function() hs.window.focusedWindow():moveToUnit(hs.layout.right70) end)

-- Hyper i to show window hints
hs.hotkey.bind(hyper, '.', function() 
    hs.hints.windowHints() 
end)

---- Hyper hjkl to switch window focus
--hs.hotkey.bind(hyper, 'h', function() hs.window.focusedWindow():focusWindowWest() end)
--hs.hotkey.bind(hyper, 'l', function() hs.window.focusedWindow():focusWindowEast() end)
--hs.hotkey.bind(hyper, 'k', function() hs.window.focusedWindow():focusWindowNorth() end)
--hs.hotkey.bind(hyper, 'j', function() hs.window.focusedWindow():focusWindowSouth() end)
--
--hs.hotkey.bind(hyper, 'k', function()
--    if hs.window.focusedWindow() then
--        hs.window.focusedWindow():focusWindowNorth()
--    else
--        hs.alert.show("No active window")
--    end
--end)
--
--hs.hotkey.bind(hyper, 'j', function()
--    if hs.window.focusedWindow() then
--        hs.window.focusedWindow():focusWindowSouth()
--    else
--        hs.alert.show("No active window")
--    end
--end)
--
--hs.hotkey.bind(hyper, 'l', function()
--    if hs.window.focusedWindow() then
--        hs.window.focusedWindow():focusWindowEast()
--    else
--        hs.alert.show("No active window")
--    end
--end)
--
--hs.hotkey.bind(hyper, 'h', function()
--    if hs.window.focusedWindow() then
--        hs.window.focusedWindow():focusWindowWest()
--    else
--        hs.alert.show("No active window")
--    end
--end)

--}}}

------------- Multiple Monitor Management --------------- {{{
-- Hotkeys to interact with the window grid
hs.hotkey.bind(hyper, ',', hs.grid.show)
hs.hotkey.bind(hyper, 'Left', hs.grid.pushWindowLeft)
hs.hotkey.bind(hyper, 'Right', hs.grid.pushWindowRight)
hs.hotkey.bind(hyper, 'Up', hs.grid.pushWindowUp)
hs.hotkey.bind(hyper, 'Down', hs.grid.pushWindowDown)

---- hyper + left move the current window to the left monitor
--hs.hotkey.bind(hyper, 'left', function() 
--    local w = hs.window.focusedWindow()
--    if not w then 
--        return
--    end
--    local s = w:screen():toWest()
--    if s then
--        w:moveToScreen(s)
--    end
--end)
--
---- hyper + right move the current window to the right monitor
--hs.hotkey.bind(hyper, 'right', function() 
--    local w = hs.window.focusedWindow()
--    if not w then 
--        return
--    end
--    local s = w:screen():toEast()
--    if s then
--        w:moveToScreen(s)
--    end
--end)

-- }}}

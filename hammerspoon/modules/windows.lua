-- Hammerspoon --
-- http://larryhynes.net/2015/02/switching-from-slate-to-hammerspoon.html
-- https://github.com/cmsj/hammerspoon-config

require "hs.application"
local hotkey = require 'hs.hotkey'
local window = require 'hs.window'
local layout = require 'hs.layout'
local alert = require 'hs.alert'
local hints = require 'hs.hints'
local grid = require 'hs.grid'
local geometry = require 'hs.geometry'

-- make window transitions much snappier
-- The default duration for animations, in seconds.
-- Initial value is 0.2; set to 0 to disable animations.
window.animationDuration = 0

------------- Window Management --------------- {{{
---- hyper d for left one half window
hotkey.bind(hyper, '[', function() window.focusedWindow():moveToUnit(layout.left50) end)
--hotkey.bind(hyper, 'd', function()
--    if window.focusedWindow() then
--        local win = window.focusedWindow()
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
--        alert.show("No active window")
--    end
--end)

-- hyper g for right one half window
hotkey.bind(hyper, ']', function() window.focusedWindow():moveToUnit(layout.right50) end)
--hotkey.bind(hyper, 'g', function()
--    if window.focusedWindow() then
--        local win = window.focusedWindow()
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
--        alert.show("No active window")
--    end
--end)

-- hyper f for fullscreen
--hotkey.bind(hyper, 'f', function() window.focusedWindow():toggleFullScreen() end)
hotkey.bind(hyper, 'tab', function()
    if window.focusedWindow() then
        local win = window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w
        f.h = max.h
        win:setFrame(f)
    else
        alert.show("No active window")
    end
end)

-- Hotkeys to resize windows absolutely
--hotkey.bind(hyper, '[', function() window.focusedWindow():moveToUnit(layout.left30) end)
--hotkey.bind(hyper, ']', function() window.focusedWindow():moveToUnit(layout.right70) end)

-- Hyper i to show window hints
hotkey.bind(hyper, '/', function()
    hints.windowHints()
end)

---- Hyper hjkl to switch window focus
--hotkey.bind(hyper, 'h', function() window.focusedWindow():focusWindowWest() end)
--hotkey.bind(hyper, 'l', function() window.focusedWindow():focusWindowEast() end)
--hotkey.bind(hyper, 'k', function() window.focusedWindow():focusWindowNorth() end)
--hotkey.bind(hyper, 'j', function() window.focusedWindow():focusWindowSouth() end)
--
--hotkey.bind(hyper, 'k', function()
--    if window.focusedWindow() then
--        window.focusedWindow():focusWindowNorth()
--    else
--        alert.show("No active window")
--    end
--end)
--
--hotkey.bind(hyper, 'j', function()
--    if window.focusedWindow() then
--        window.focusedWindow():focusWindowSouth()
--    else
--        alert.show("No active window")
--    end
--end)
--
--hotkey.bind(hyper, 'l', function()
--    if window.focusedWindow() then
--        window.focusedWindow():focusWindowEast()
--    else
--        alert.show("No active window")
--    end
--end)
--
--hotkey.bind(hyper, 'h', function()
--    if window.focusedWindow() then
--        window.focusedWindow():focusWindowWest()
--    else
--        alert.show("No active window")
--    end
--end)

--}}}

------------- Multiple Monitor Management --------------- {{{
-- Defines for window grid
--grid.GRIDWIDTH = 3
--grid.GRIDHEIGHT = 3
--grid.MARGINX = 0
--grid.MARGINY = 0
-- Hotkeys to interact with the window grid
hotkey.bind(hyper, ',', grid.show)
hotkey.bind(hyper, 'Left', grid.pushWindowLeft)
hotkey.bind(hyper, 'Right', grid.pushWindowRight)
hotkey.bind(hyper, 'Up', grid.pushWindowUp)
hotkey.bind(hyper, 'Down', grid.pushWindowDown)

---- hyper + left move the current window to the left monitor
--hotkey.bind(hyper, 'left', function()
--    local w = window.focusedWindow()
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
--hotkey.bind(hyper, 'right', function()
--    local w = window.focusedWindow()
--    if not w then
--        return
--    end
--    local s = w:screen():toEast()
--    if s then
--        w:moveToScreen(s)
--    end
--end)

-- }}}

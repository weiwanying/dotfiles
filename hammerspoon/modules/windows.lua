-- Reference:
-- http://larryhynes.net/2015/02/switching-from-slate-to-hammerspoon.html
-- https://github.com/cmsj/hammerspoon-config

local application = require "hs.application"
local hotkey = require 'hs.hotkey'
local window = require 'hs.window'
local layout = require 'hs.layout'
local alert = require 'hs.alert'
local hints = require 'hs.hints'
local grid = require 'hs.grid'
local geometry = require 'hs.geometry'

-- The default duration for animations, in seconds.
-- Initial value is 0.2; You can set to 0 to disable animations, make window transitions much snappier.
window.animationDuration = 0.2

-- {{{ Window Management
-- left half window
hotkey.bind(hyper, '[', function() window.focusedWindow():moveToUnit(layout.left50) end)
---- {{{ complex method to achieve left window
--hotkey.bind(hyper, '[', function()
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
---- }}}}

-- right half window
hotkey.bind(hyper, ']', function() window.focusedWindow():moveToUnit(layout.right50) end)

-- fullscreen
--hotkey.bind(hyper, 'tab', function() window.focusedWindow():toggleFullScreen() end)

hotkey.bind(hyper, 'tab', function() toggle_fullscreen() end)
-- Defines for window maximize toggler
local frameCache = {}
-- Toggle a window between its normal size, and being maximized
function toggle_fullscreen()
    local win = window.focusedWindow()
    if frameCache[win:id()] then
        win:setFrame(frameCache[win:id()])
        frameCache[win:id()] = nil
    else
        frameCache[win:id()] = win:frame()
        win:maximize()
    end
end

--hotkey.bind(hyperShift, '[', function() window.focusedWindow():moveToUnit(layout.left30) end)
--hotkey.bind(hyperShift, ']', function() window.focusedWindow():moveToUnit(layout.right70) end)

-- show window hints
hotkey.bind(hyper, '/', function()
    hints.windowHints()
end)

---- switch window focus
--hotkey.bind(hyper, 'h', function() window.focusedWindow():focusWindowWest() end)
--hotkey.bind(hyper, 'l', function() window.focusedWindow():focusWindowEast() end)
--hotkey.bind(hyper, 'k', function() window.focusedWindow():focusWindowNorth() end)
--hotkey.bind(hyper, 'j', function() window.focusedWindow():focusWindowSouth() end)
--}}}
-- {{{ Multiple Monitors Management
-- Defines for window grid
--grid.GRIDWIDTH = 3
--grid.GRIDHEIGHT = 3
--grid.MARGINX = 0
--grid.MARGINY = 0

-- interact with the window grid
hotkey.bind(hyper, ',', grid.show)
hotkey.bind(hyper, 'Left', grid.pushWindowLeft)
hotkey.bind(hyper, 'Right', grid.pushWindowRight)
hotkey.bind(hyper, 'Up', grid.pushWindowUp)
hotkey.bind(hyper, 'Down', grid.pushWindowDown)
-- }}}
-- {{{ Mouse Hightlight
hotkey.bind(hyper, '0', function() mouseHighlight() end)

-- draw a bright red circle around the mouse pointer for a few seconds
function mouseHighlight()
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    mousepoint = hs.mouse.getAbsolutePosition()
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:bringToFront(true)
    mouseCircle:show(0.5)

    mouseCircleTimer = hs.timer.doAfter(3, function()
        mouseCircle:hide(0.5)
        hs.timer.doAfter(0.6, function() mouseCircle:delete() end)
    end)
end
--}}}

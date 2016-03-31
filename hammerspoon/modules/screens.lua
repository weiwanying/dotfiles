-- https://github.com/bezhermoso/dotfiles/tree/master/hammerspoon

local window = require "hs.window"
local hotkey = require "hs.hotkey"
local fnutils = require "hs.fnutils"
local geometry = require "hs.geometry"
local mouse = require "hs.mouse"

local screen_switch_key = '.';

------------- Multiple Screen Focus Switch --------------- {{{

--One hotkey should just suffice for dual-display setups as it will naturally
--cycle through both.
--A second hotkey to reverse the direction of the focus-shift would be handy
--for setups with 3 or more displays.

--Predicate that checks if a window belongs to a screen
local function isInScreen(sc, win)
    return win:screen() == sc
end

local function moveMouseToScreen(sc)
    local pt = geometry.rectMidPoint(sc:fullFrame())
    mouse.setAbsolutePosition(pt)
end

local function focusScreen(sc, moveMouse)
    --Get windows within screen, ordered from front to back.
    --If no windows exist, bring focus to desktop. Otherwise, set focus on
    --front-most application window.
    if not sc then return end

    local windows = fnutils.filter(
    window.orderedWindows(),
    fnutils.partial(isInScreen, sc))
    local windowToFocus = #windows > 0 and windows[1] or window.desktop()
    windowToFocus:focus()

    if moveMouse then moveMouseToScreen(sc) end
end

--Bring focus to next display/screen
hotkey.bind(hyper, screen_switch_key, function ()
    local focused = window.focusedWindow()
    if not focused then return end
    local sc = focused:screen()
    if not sc then return end
    focusScreen(window.focusedWindow():screen():next(), true)
end)

--Bring focus to previous display/screen
hotkey.bind(hyperShift, screen_switch_key, function()
    local focused = window.focusedWindow()
    if not focused then return end
    local sc = focused:screen()
    if not sc then return end
    focusScreen(window.focusedWindow():screen():previous(), true)
end)

-- END DISPLAY FOCUS SWITCHING -- }}}

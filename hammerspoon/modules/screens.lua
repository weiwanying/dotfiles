-- https://github.com/bezhermoso/dotfiles/tree/master/hammerspoon

local window = require "hs.window"
local hotkey = require "hs.hotkey"
local fnutils = require "hs.fnutils"
local geometry = require "hs.geometry"
local mouse = require "hs.mouse"
local layout = require 'hs.layout'

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

------------- Multiple Screen Layouts --------------- {{{
local screen_macbook    = "Color LCD"
local screen_u2414h     = "DELL U2414H"

--  Format reminder:
--      {"App name", "Window name", "Display Name", "unitrect", "framerect", "fullframerect"},
--      geometry.rect('X','Y','Width','Height')
--      geometry.unitrect(X%,Y%,Width%,Height%)
local layout_internal = {
    {"AppCleaner",        nil,          screen_macbook, geometry.unitrect(0, 0.6, 0.4, 0.4), nil, nil},
    {"Notes",             nil,          screen_macbook, geometry.unitrect(0.5, 0.5, 0.5, 0.5), nil, nil},
    {"Finder",            nil,          screen_macbook, geometry.unitrect(0, 0, 0.6, 0.6), nil, nil},
    {"NeteaseMusic",      nil,          screen_macbook, layout.left50, nil, nil},
    {"WeChat",            nil,          screen_macbook, layout.left70, nil, nil},
    {"Dash",              nil,          screen_macbook, layout.left70, nil, nil},
    {"Dictionary",        nil,          screen_macbook, geometry.unitrect(0.4, 0.2, 0.6, 0.8), nil, nil},
    {"Calendar",          nil,          screen_macbook, layout.maximized, nil, nil},
    {"Messages",          nil,          screen_macbook, layout.right50, nil, nil},
    {"App Store",         nil,          screen_macbook, layout.left75, nil, nil},
    {"iTunes",            "MiniPlayer", screen_macbook, nil, nil, geometry.rect(0, -48, 400, 48)},
    {"Tweetbot",          nil,          screen_macbook, layout.left50, nil, nil},
    {"Evernote",          nil,          screen_macbook, layout.left75, nil, nil},
    {"Google Chrome",     nil,          screen_macbook, layout.maximized, nil, nil},
    {"MacDown",           nil,          screen_macbook, geometry.unitrect(0, 0.5, 1, 0.5), nil, nil},
    {"Ulysses",           nil,          screen_macbook, layout.right50, nil, nil},
    {"OmniFocus",         nil,          screen_macbook, layout.left70, nil, nil},
    {"Reeder",            nil,          screen_macbook, layout.maximized, nil, nil},
    {"Mail",              nil,          screen_macbook, layout.left75, nil, nil},
    {"1Password",         nil,          screen_macbook, layout.left50, nil, nil},
    {"iTunes",            "iTunes",     screen_macbook, layout.maximized, nil, nil},
    {"Preview",           nil,          screen_macbook, layout.left75, nil, nil},
    {"iTerm2",            nil,          screen_macbook, layout.maximized, nil, nil},
}

local layout_multiple= {
    {"AppCleaner",        nil,          screen_macbook, geometry.unitrect(0, 0.6, 0.4, 0.4), nil, nil},
    {"Notes",             nil,          screen_u2414h, geometry.unitrect(0.5, 0.5, 0.5, 0.5), nil, nil},
    {"Finder",            nil,          screen_u2414h, geometry.unitrect(0, 0, 0.6, 0.6), nil, nil},
    {"NeteaseMusic",      nil,          screen_macbook, layout.left50, nil, nil},
    {"WeChat",            nil,          screen_macbook, layout.left70, nil, nil},
    {"Dash",              nil,          screen_macbook, layout.left70, nil, nil},
    {"Dictionary",        nil,          screen_macbook, geometry.unitrect(0.4, 0.2, 0.6, 0.8), nil, nil},
    {"Calendar",          nil,          screen_macbook, layout.maximized, nil, nil},
    {"Messages",          nil,          screen_macbook, layout.right50, nil, nil},
    {"App Store",         nil,          screen_macbook, layout.left75, nil, nil},
    {"iTunes",            "MiniPlayer", screen_macbook, nil, nil, geometry.rect(0, -48, 400, 48)},
    {"Tweetbot",          nil,          screen_macbook, layout.left50, nil, nil},
    {"Evernote",          nil,          screen_u2414h, layout.left75, nil, nil},
    {"Google Chrome",     nil,          screen_u2414h, layout.maximized, nil, nil},
    {"MacDown",           nil,          screen_u2414h, geometry.unitrect(0, 0.5, 1, 0.5), nil, nil},
    {"Ulysses",           nil,          screen_u2414h, layout.right50, nil, nil},
    {"OmniFocus",         nil,          screen_u2414h, layout.left70, nil, nil},
    {"Reeder",            nil,          screen_u2414h, layout.maximized, nil, nil},
    {"Mail",              nil,          screen_u2414h, layout.left75, nil, nil},
    {"1Password",         nil,          screen_u2414h, layout.left50, nil, nil},
    {"iTunes",            "iTunes",     screen_macbook, layout.maximized, nil, nil},
    {"Preview",           nil,          screen_macbook, layout.left75, nil, nil},
    {"iTerm2",            nil,          screen_u2414h, layout.maximized, nil, nil},
}

-- Only one screen
hotkey.bind(hyper, '1', function() layout.apply(layout_internal) end)
-- Multiple screens
hotkey.bind(hyper, '2', function() layout.apply(layout_multiple) end)
--}}}

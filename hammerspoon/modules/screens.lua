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
local screen_1970w      = "1970W"

--  Format reminder:
--      {"App name", "Window name", "Display Name", "unitrect", "framerect", "fullframerect"},
--      geometry.rect('X','Y','Width','Height')
--      geometry.unitrect(X%,Y%,Width%,Height%)
local this_screen = screen_macbook
local layout_macbook = {
    {"AppCleaner",        nil,          this_screen, geometry.unitrect(0, 0.6, 0.4, 0.4), nil, nil},
    {"Finder",            nil,          this_screen, geometry.unitrect(0, 0, 0.6, 0.6), nil, nil},
    {"NeteaseMusic",      nil,          this_screen, layout.left50, nil, nil},
    {"WeChat",            nil,          this_screen, layout.left70, nil, nil},
    {"Dash",              nil,          this_screen, layout.left70, nil, nil},
    {"Dictionary",        nil,          this_screen, geometry.unitrect(0.4, 0.2, 0.6, 0.8), nil, nil},
    {"Calendar",          nil,          this_screen, layout.left70, nil, nil},
    {"Messages",          nil,          this_screen, layout.right50, nil, nil},
    {"App Store",         nil,          this_screen, layout.left75, nil, nil},
    {"iTunes",            "MiniPlayer", this_screen, nil, nil, geometry.rect(0, -48, 400, 48)},
    {"Tweetbot",          nil,          this_screen, layout.left50, nil, nil},
}

local this_screen = screen_u2414h
local layout_u2414h= {
    {"Evernote",          nil,          this_screen, layout.left75, nil, nil},
    {"Google Chrome",     nil,          this_screen, layout.maximized, nil, nil},
    {"MacDown",           nil,          this_screen, geometry.unitrect(0, 0.5, 1, 0.5), nil, nil},
    {"Ulysses",           nil,          this_screen, layout.right50, nil, nil},
    {"OmniFocus",         nil,          this_screen, layout.left70, nil, nil},
    {"Reeder",            nil,          this_screen, layout.maximized, nil, nil},
    {"Mail",              nil,          this_screen, layout.left75, nil, nil},
    {"1Password",         nil,          this_screen, layout.left50, nil, nil},
    {"iTunes",            "iTunes",     this_screen, layout.maximized, nil, nil},
    {"Preview",           nil,          this_screen, layout.left75, nil, nil},
}

local this_screen = screen_1970w
local layout_1970w = {
    {"iTerm2",            nil,          this_screen, geometry.unitrect(0, 0.03, 1, 0.97), nil, nil},
}

hotkey.bind(hyper, '1', function() layout.apply(layout_macbook) end)
hotkey.bind(hyper, '2', function() layout.apply(layout_u2414h) end)
hotkey.bind(hyper, '3', function() layout.apply(layout_1970w) end)
--}}}

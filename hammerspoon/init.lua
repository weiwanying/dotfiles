
-- Hammerspoon --
-- http://www.hammerspoon.org/ --

------------- Sset hyper to ctrl + cmd ---------------
local hyper = {'ctrl', 'cmd'}
--local hyper = {'ctrl', 'alt', 'cmd'}
local hyperShift = {'ctrl', 'alt', 'cmd', 'shift'}

------------- Reload config after write ---------------
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()
hs.alert.show("Hammerspoon Config loaded")

------------- Switch to Application ---------------
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
    hs.hotkey.bind(hyper, key, function() 
        hs.application.launchOrFocus(app) 
    end)
end

------------- Window Management ---------------
-- hyper + up maximize the current window
hs.hotkey.bind(hyper, 'up', function()
    hs.grid.maximizeWindow() 
end)

-- Hints all valid windows
hs.hotkey.bind(hyper, 'h', function() 
    hs.hints.windowHints(getAllValidWindows()) 
end)
function getAllValidWindows ()
	local allWindows = hs.window.allWindows()
	local windows = {}
	local index = 1
	for i = 1, #allWindows do
		local w = allWindows[i]
		if w:screen() then
			windows[index] = w
			index = index + 1
		end
	end
	return windows
end

------------- Multiple Monitor Management ---------------
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

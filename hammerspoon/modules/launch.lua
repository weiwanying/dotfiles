local hotkey = require 'hs.hotkey'
local window = require 'hs.window'
local application = require 'hs.application'

------------- Switch to Application ---------------{{{
local key2App = {
    c = 'AppCleaner',
    e = 'Evernote',
    j = 'Google Chrome',
    k = 'MacDown',
    m = 'Finder',
    n = 'NeteaseMusic',
    o = 'OmniFocus',
    p = '1Password',
    r = 'Reeder',
    s = 'Dash',
    u = 'Ulysses',
    z = 'Dictionary'
}

for key, app in pairs(key2App) do
    hotkey.bind(hyper, key, function()
        --application.launchOrFocus(app)
        toggle_application(app)
    end)
end

-- hammerspoon console
--hotkey.bind(hyper, ';', hs.openConsole)

-- iTerm console
hotkey.bind(hyper, ';', function()
    toggle_application("iTerm")
end)

-- reload
hotkey.bind(hyper, 'escape', function() hs.reload() end )

--}}}

-- {{{ toggle_application
-- Toggle an application between being the frontmost app, and being hidden
function toggle_application(_app)
    -- finds a running applications
	local app = application.find(_app)

	if not app then
        -- application not running, launch app
        application.launchOrFocus(_app)
        return
	end

    -- application running, toggle hide/unhide
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
        -- no windows, maybe hide
        if true == app:hide() then
            -- focus app
            application.launchOrFocus(_app)
        else
            -- nothing to do
        end
	end
end

-- }}}

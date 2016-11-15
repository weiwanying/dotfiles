[Hammerspoon](http://www.hammerspoon.org/)
====

[Mac神器hammerspoon](http://seanxp.com/2016/mac-hammerspoon/)

## hotkey settings - modules/hotkey.lua

###`hyper` = `ctrl` + `cmd`
###`hyperShift` = `ctrl` + `cmd` + `Shift`

## Toggle Application - modules/launch.lua

| Key | Description |
|-----|-------------|
| `hyper`+`a` | AppCleaner |
| `hyper`+`b` | Notes |
| `hyper`+`c` | Calendar |
| `hyper`+`d` | (system hotkey) Define word |
| `hyper`+`e` | Evernote |
| `hyper`+`f` | Finder |
| `hyper`+`g` | Mail |
| `hyper`+`h` | Dash |
| `hyper`+`i` | iTunes |
| `hyper`+`j` | Google Chrome |
| `hyper`+`k` | Preview |
| `hyper`+`l` | Dictionary |
| `hyper`+`m` | MacDown |
| `hyper`+`n` | NeteaseMusic |
| `hyper`+`o` | OmniFocus |
| `hyper`+`p` | 1Password |
| `hyper`+`q` | App Store |
| `hyper`+`r` | Reeder |
| `hyper`+`s` | System Preferences |
| `hyper`+`t` | Tweetbot |
| `hyper`+`u` | Ulysses |
| `hyper`+`v` | Parallels Desktop |
| `hyper`+`w` | WeChat |
| `hyper`+`x` | Papers |
| `hyper`+`y` | Messages |
| `hyper`+`z` | Sublime Text |
| `hyper`+`;` | iTerm |
| `hyper`+`'` |  |
| `hyper`+`ESC` | Reload Hammerspoon Config |

### auto reload - modules/auto_reload.lua

automatically reload the configuration whenever the file changes.

### Window Layouts - modules/windows.lua

| Key | Description |
|-----|-------------|
| `hyper`+`[` | Set the current app to left layout |
| `hyper`+`tab` | Toggle the current app to fullscreen layout or normal layout |
| `hyper`+`]` | Set the current app to right layout |
| `hyper`+`,` | Show the window grid |
| `hyper`+`Left` | Push the current app to the left screen |
| `hyper`+`Right` | Push the current app to the right screen |
| `hyper`+`Up` | Push the current app to the up screen |
| `hyper`+`Down` | Push the current app to the down screen |
| `hyper`+`/` | Show Window Hints |

### Move between displays - modules/screens.lua

| Key | Description |
|-----|-------------|
| `hyper`+ `.` | Move to next display |
| `hyperShift`+ `.` | Move to previous display |

### System hotkey - modules/system.lua

| Key | Description |
|-----|-------------|
| `hyper`+ **`** | lock screen |

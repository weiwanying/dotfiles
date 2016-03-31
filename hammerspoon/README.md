[Hammerspoon](http://www.hammerspoon.org/)
====

## hotkey settings - modules/hotkey.lua

###`hyper` = `ctrl` + `cmd`
###`hyperShift` = `ctrl` + `cmd` + `Shift`

## Focus Application - modules/launch.lua

| Key | Description |
|-----|-------------|
| `hyper`+`c` | Toggle AppCleaner |
| `hyper`+`e` | Toggle Evernote |
| `hyper`+`j` | Toggle Google Chrome |
| `hyper`+`k` | Toggle Preview |
| `hyper`+`m` | Toggle Finder |
| `hyper`+`n` | Toggle NeteaseMusic |
| `hyper`+`o` | Toggle OmniToggle |
| `hyper`+`p` | Toggle 1Password |
| `hyper`+`r` | Toggle Reeder |
| `hyper`+`u` | Toggle Ulysses |
| `hyper`+`w` | Toggle MacDown |
| `hyper`+`z` | Toggle Dictionary |
| `hyper`+`;` | Toggle iTerm |
| `hyper`+`ESC` | Reload Hammerspoon Config |

### auto reload - modules/auto_reload.lua

automatically reload the configuration whenever the file changes.

### Window Layouts - modules/windows.lua

| Key | Description |
|-----|-------------|
| `hyper`+`[` | Set the current app to left layout |
| `hyper`+`f` | Set the current app to fullscreen layout |
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

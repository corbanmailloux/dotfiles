#!/usr/bin/osascript

# <bitbar.title>Zoom Mute Status</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Corban Mailloux</bitbar.author>
# <bitbar.author.github>corbanmailloux</bitbar.author.github>
# <bitbar.desc>Zoom Mute Status</bitbar.desc>
# <bitbar.dependencies>Applescript</bitbar.dependencies>
# <bitbar.abouturl>https://corb.co</bitbar.abouturl>

# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>false</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>false</swiftbar.hideSwiftBar>

# Uses SwiftBar: https://github.com/swiftbar/SwiftBar

# Inspired by https://chromatichq.com/insights/quick-win-zoom-mute-status-macos-menubar/
# and https://github.com/nickjvturner/SwiftBar-Zoom-Plugins

property btnTitle : "Mute audio"

if application "zoom.us" is running then
	tell application "System Events"
		tell application process "zoom.us"
			if exists (menu bar item "Meeting" of menu bar 1) then
				if exists (menu item btnTitle of menu 1 of menu bar item "Meeting" of menu bar 1) then
					set returnValue to ":mic.fill: | sfcolor=#c22d08"
				else
					set returnValue to ":mic.slash.fill: | sfcolor=#038a20"
				end if
			else
				set returnValue to " |"
			end if
		end tell
	end tell
else
	set returnValue to " |"
end if

return returnValue & " size=16
---
Zoom Mute Status"

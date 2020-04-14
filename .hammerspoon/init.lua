-- Using Karabiner-Elements, Caps Lock can function as a hyper key.
local hyper = {"shift", "ctrl", "alt", "cmd"}

-- Hammerspoon setup
hs.hotkey.bind(hyper, "R", function()
  hs.reload()
end)
hs.alert.show("🥄 Hammerspoon configuration loaded. 🥄")

-- Basic window management, replacing Spectacle.
hs.loadSpoon("MiroWindowsManager")
hs.window.animationDuration = 0.1
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "f"}
})

-- Application quick switch
-- C for Chrome, T for iTerm, S for Slack
-- TODO: Maybe move these to hyper + number keys? It would be easier to type, but maybe harder to remember.

hs.hotkey.bind(
  hyper, "C", function()
    hs.application.launchOrFocus("Google Chrome")
  end
)

hs.hotkey.bind(
  hyper, "T", function()
    hs.application.launchOrFocus("iTerm")
  end
)

hs.hotkey.bind(
  hyper, "S", function()
    hs.application.launchOrFocus("Slack")
  end
)

hs.hotkey.bind(
  hyper, "Z", function()
    hs.application.launchOrFocus("zoom.us")
  end
)

hs.hotkey.bind(
  hyper, "A", function()
    hs.application.launchOrFocus("Authy Desktop")
  end
)

-- Media controls
hs.hotkey.bind(
  hyper, "P", function()
    hs.spotify.displayCurrentTrack()
  end
)

--- Testing / Playground
hs.hotkey.bind(
  hyper, "W", function()
    hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
  end
)

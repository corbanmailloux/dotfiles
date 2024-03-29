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
-- C for Chrome, T for iTerm, S for Slack, A for Authy, Z for Zoom, X for Messages
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

hs.hotkey.bind(
  hyper, "`", function()
    hs.application.launchOrFocus("Home Assistant")
  end
)

hs.hotkey.bind(
  hyper, "X", function()
    hs.application.launchOrFocus("Messages")
  end
)

-- -- Media controls
-- hs.hotkey.bind(
--   hyper, "P", function()
--     hs.spotify.displayCurrentTrack()
--   end
-- )

-- --- Testing / Playground
-- hs.hotkey.bind(
--   hyper, "W", function()
--     hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
--   end
-- )

-- Home Assistant:
-- I've moved my Home Assistant hotkeys into Alfred workflows for now, but I'm leaving this here for reference.
-- headers = {}
-- headers["Authorization"] = "Bearer FAKE"
-- headers["Content-Type"] = "application/json"

-- -- Toggle the left desk lamp
-- hs.hotkey.bind(
--   hyper, "1", function()
--     data = '{"entity_id": "light.plant_lamp"}'
--     hs.http.post("https://<HOME_ASSISTANT_URL>/api/services/light/toggle", data, headers)
--   end
-- )

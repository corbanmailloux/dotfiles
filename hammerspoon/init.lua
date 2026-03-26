-- Using Karabiner-Elements, Caps Lock can function as a "hyper" key.
local hyper = {"shift", "ctrl", "alt", "cmd"}

-- Use SpoonInstall to manage Hammerspoon Spoons
hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall

-- Hammerspoon setup
hs.hotkey.bind(hyper, "R", function()
  hs.reload()
  -- spoon.Seal.plugins.apps:restart()
end)
hs.alert.show("🥄 Hammerspoon configuration loaded. 🥄")

-- Window management
Install:andUse("MiroWindowsManager", {
  -- config = {
  --   GRID = { w = 3, h = 3 },
  --   use_frame_correctness = true,
  --   resize_step = 50,
  -- },
  hotkeys = {
    up = {hyper, "up"},
    right = {hyper, "right"},
    down = {hyper, "down"},
    left = {hyper, "left"},
    fullscreen = {hyper, "f"}
  }
})
hs.window.animationDuration = 0.1

-- -- Seal - Alfred-like app launcher for Hammerspoon
-- Install:andUse("Seal", {
--   hotkeys = {
--     show = {hyper, "space"}
--   },
--   fn = function(s)
--     s:loadPlugins({"apps", "calc", "useractions", "filesearch"})
--     s.plugins.useractions.actions =
--       {
--         ["Google Search"] = {
--             url = "https://www.google.com/search?q=${query}",
--             description = "Search Google with the query",
--             keyword = "gg", -- Type 'gg <query>' in Seal
--           }
--       }
--     s:refreshAllCommands()
--   end,
--   start = true
-- })

-- Install:andUse("TextClipboardHistory", {
--   hotkeys = {
--     toggle_clipboard = {hyper, "b"}
--   },
--   config = {
--     paste_on_select = true,
--     show_in_menubar = false,
--     max_clipboard_items = 50
--   },
--   start = true
-- })

-- Application quick switch
-- C for Chrome, T for iTerm, Z for Zoom, X for Messages
-- TODO: Maybe move these to hyper + number keys? It would be easier to type, but maybe harder to remember.

-- hs.hotkey.bind(
--   hyper, "C", function()
--     hs.application.launchOrFocus("Google Chrome")
--   end
-- )

hs.hotkey.bind(
  hyper, "T", function()
    hs.application.launchOrFocus("iTerm")
  end
)

hs.hotkey.bind(
  hyper, "Z", function()
    hs.application.launchOrFocus("zoom.us")
  end
)

-- hs.hotkey.bind(
--   hyper, "X", function()
--     hs.application.launchOrFocus("Messages")
--   end
-- )

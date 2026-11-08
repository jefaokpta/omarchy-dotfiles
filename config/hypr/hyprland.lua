-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.
-- o.window("qemu", { workspace = "5" })

-- Bigger Quake console (SUPER+S). Omarchy's default is 50% height, 2:1 panel.
-- Re-applies after Omarchy's own refit so these values win.
local qc_share = 0.85 -- fraction of screen height
local qc_width = 0.9  -- fraction of screen width
local function qc_fit(mon)
  local ws = hl.get_workspace("special:qconsole")
  mon = mon or (ws and ws.visible and ws.monitor) or hl.get_active_monitor()
  if not mon or not mon.scale or mon.scale <= 0 then return end
  local w, h = mon.width, mon.height
  if mon.transform % 2 == 1 then w, h = h, w end
  local r = mon.reserved
  h = h / mon.scale - r.top - r.bottom
  w = w / mon.scale - r.left - r.right
  local side = math.floor(w * (1 - qc_width) / 2)
  hl.workspace_rule({
    workspace = "special:qconsole",
    gaps_in = 0,
    gaps_out = { top = 0, right = side, bottom = math.floor(h * (1 - qc_share)), left = side },
    no_border = true,
  })
  hl.exec_scheduled_prop_refresh_immediately()
end
qc_fit()
for _, ev in ipairs({ "monitor.layout_changed", "monitor.focused", "window.open", "window.destroy", "window.move_to_workspace" }) do
  hl.on(ev, function() qc_fit() end)
end
hl.on("workspace.special_active", function(ws, mon) if ws and ws.name == "special:qconsole" then qc_fit(mon) end end)
hl.on("workspace.move_to_monitor", function(ws, mon) if ws and ws.name == "special:qconsole" then qc_fit(mon) end end)

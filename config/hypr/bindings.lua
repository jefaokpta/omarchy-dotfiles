-- Keep only your personal keybinding overrides here. Add new bindings with
-- o.bind or replace defaults with o.rebind.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding. o.rebind takes the same arguments as o.bind.
-- This example replaces the default file manager with Flea.
-- o.rebind("SUPER + SHIFT + F", "File manager", { launch = "flea" })

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, { panel = "omarchy.emojis" })

-- WhatsApp on SUPER+SHIFT+W (was: Omawrite)
o.rebind("SUPER + SHIFT + W", "WhatsApp", { webapp = "https://web.whatsapp.com/", focus = true })

-- Google Chat on SUPER+SHIFT+C (was: Calendar)
o.rebind("SUPER + SHIFT + C", "Google Chat", { webapp = "https://chat.google.com/?authuser=jefferson.reis@vipsolutions.com.br", focus = true })

-- VS Code on SUPER+SHIFT+V
o.bind("SUPER + SHIFT + V", "VS Code", { launch = "code", focus = "^[Cc]ode$" })

-- IntelliJ IDEA on SUPER+SHIFT+I (was: Switch input language back)
o.rebind("SUPER + SHIFT + I", "IntelliJ IDEA", { launch = "gtk-launch jetbrains-idea", focus = "^jetbrains-idea$" })

-- Quake console (opens claude) on SUPER+S (was: Toggle scratchpad)
o.rebind("SUPER + S", "Toggle Quake console", hl.dsp.workspace.toggle_special("qconsole"))

-- YouTube Music on SUPER+SHIFT+M (was: Spotify)
o.rebind("SUPER + SHIFT + M", "YouTube Music", { webapp = "https://music.youtube.com/", focus = true })

-- SUPER+1..0 switches the same workspace number on ALL monitors (focus stays on current monitor)
for workspace = 1, 10 do
  o.rebind("SUPER + code:" .. tostring(workspace + 9), "Switch all monitors to workspace " .. workspace, function()
    local current = hl.get_active_monitor()
    if not current then return end
    for _, monitor in ipairs(hl.get_monitors()) do
      if monitor.name ~= current.name and not monitor.is_mirror then
        o.workspaces.focus(workspace, monitor.name)()
      end
    end
    o.workspaces.focus(workspace, current.name)()
  end)
end

-- Terminal always opens in home (don't inherit cwd of active window)
o.rebind("SUPER + RETURN", "Terminal", "omarchy-launch-terminal")

-- Move all windows from workspace 2 to workspace 1 on SUPER+ALT+M
o.bind("SUPER + ALT + M", "Move all windows from workspace 2 to 1", [[bash -c 'for a in $(hyprctl clients -j | jq -r ".[] | select(.workspace.id==2) | .address"); do hyprctl dispatch "hl.dsp.window.move({ workspace = \"1\", follow = false, window = \"address:$a\" })"; done']])

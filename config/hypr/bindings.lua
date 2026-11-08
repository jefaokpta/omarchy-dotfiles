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
o.rebind("SUPER + SHIFT + C", "Google Chat", { webapp = "https://chat.google.com/", focus = true })

-- VS Code on SUPER+SHIFT+V
o.bind("SUPER + SHIFT + V", "VS Code", { launch = "code", focus = "^[Cc]ode$" })

-- IntelliJ IDEA on SUPER+SHIFT+I (was: Switch input language back)
o.rebind("SUPER + SHIFT + I", "IntelliJ IDEA", { launch = "gtk-launch jetbrains-idea", focus = "^jetbrains-idea$" })

-- Quake console (opens claude) on SUPER+S (was: Toggle scratchpad)
o.rebind("SUPER + S", "Toggle Quake console", hl.dsp.workspace.toggle_special("qconsole"))

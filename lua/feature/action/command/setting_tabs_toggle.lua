--res://lua/feature/action/command/setting_tabs_toggle.lua
local Enum_Data = require("lua.enum.enum_data")
local Menu_State = require("lua.feature.action.state.menu_state")

---@class Command.Setting_Tabs_Toggle
local Setting_Tabs_Toggle = {
}

function Setting_Tabs_Toggle:action()
    Menu_State:switch(Enum_Data.MENU_STATE.SETTING_TABS_TOGGLE)
end

return Setting_Tabs_Toggle

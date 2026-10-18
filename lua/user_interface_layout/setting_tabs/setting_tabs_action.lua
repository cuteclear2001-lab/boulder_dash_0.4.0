--res://lua/user_interface_layout/setting_tabs/setting_tabs_action.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.user_interface_layout.setting_tabs.setting_tabs_data")
--local Menu_State = require("lua.feature.action.menu_state")
--local Game_State = require("lua.feature.data.game_state")

---@class Action.Setting_Tabs
local Setting_Tabs = {
}

---@param control Control
function Setting_Tabs:init(control)
    Data.control = control
--    local callable = Callable(function()self["onPressed"](self)end)
--    button.pressed:connect(callable)
end

function Setting_Tabs:toggle()
    ---@type Control
    local control = Data.control
    control.visible = not control.visible
end

return Setting_Tabs

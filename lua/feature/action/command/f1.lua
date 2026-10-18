--res://lua/feature/action/command/f1.lua
local Enum_Data = require("lua.enum.enum_data")
local Menu_State = require("lua.feature.action.state.menu_state")

---@class Command.F1
local F1 = {
}

function F1:action()
    Menu_State:switch(Enum_Data.MENU_STATE.INFO_FRAME_TOGGLE)
end

return F1

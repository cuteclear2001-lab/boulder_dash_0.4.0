--res://lua/user_interface_layout/info_frame/info_frame_action.lua
local Data = require("lua.user_interface_layout.info_frame.info_frame_data")

---@class Action.Info_Frame
local Info_Frame = {
}

---@param control Control
function Info_Frame:init(control)
    Data.control = control
end

function Info_Frame:toggle()
    ---@type Control
    local control = Data.control
    if not is_instance_valid(control) then
        return
    end
    control.visible = not control.visible
end

return Info_Frame

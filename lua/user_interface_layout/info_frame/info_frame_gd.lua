--res://lua/user_interface_layout/info_frame/info_frame_gd.lua
local Action = require("lua.user_interface_layout.info_frame.info_frame_action")

---@class Gd.Info_Frame:Control
local Info_Frame = {
    extends = Control,
}

function Info_Frame:_ready()
    self:init()
end

function Info_Frame:init()
    Action:init(self)
end

return Info_Frame

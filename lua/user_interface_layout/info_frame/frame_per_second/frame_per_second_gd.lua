--res://lua/user_interface_layout/info_frame/frame_per_second/frame_per_second_gd.lua
local Action = require("lua.user_interface_layout.info_frame.frame_per_second.frame_per_second_action")

---@class Gd.Frame_Per_Second:Label
local Frame_Per_Second = {
    extends = Label,
}

function Frame_Per_Second:_ready()
    self:init()
end

function Frame_Per_Second:init()
    Action:init(self)
end

return Frame_Per_Second

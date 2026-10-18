--res://lua/user_interface_layout/info_frame/memory_label/memory_label_gd.lua
local Action = require("lua.user_interface_layout.info_frame.memory_label.memory_label_action")

---@class Gd.Memory_Label:Label
local Memory_Label = {
    extends = Label,
}

function Memory_Label:_ready()
    self:init()
end

function Memory_Label:init()
    Action:init(self)
end

return Memory_Label

--res://lua/user_interface_layout/info_frame/performance_label/performance_label_gd.lua
local Action = require("lua.user_interface_layout.info_frame.performance_label.performance_label_action")

---@class Gd.Performance_Label:Label
local Performance_Label = {
    extends = Label,
}

function Performance_Label:_ready()
    self:init()
end

function Performance_Label:init()
    Action:init(self)
end

return Performance_Label

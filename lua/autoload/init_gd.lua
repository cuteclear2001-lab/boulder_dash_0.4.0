--res://lua/autoload/init_gd.lua
local Bind_Control = require("lua.feature.action.bind_control")

---@class Init_Gd:Node
local Init_Gd = {
    extends = Node,
}

function Init_Gd:_ready()
    self:init()
end

function Init_Gd:init()
    Bind_Control:init()
end

return Init_Gd

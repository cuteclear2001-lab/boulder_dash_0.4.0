--res://lua/user_interface_layout/cave_difficulty_select/cave_list/cave_list_gd.lua
local Action = require("lua.user_interface_layout.cave_difficulty_select.cave_list.cave_list_action")

---@class Gd.Cave_List:HBoxContainer
local Cave_List = {
    extends = HBoxContainer,
}

function Cave_List:_ready()
    self:init()
end

function Cave_List:init()
    Action:init(self)
end

return Cave_List

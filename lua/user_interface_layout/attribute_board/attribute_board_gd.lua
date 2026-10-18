--res://lua/user_interface_layout/attribute_board/attribute_board_gd.lua
local Action = require("lua.user_interface_layout.attribute_board.attribute_board_action")

---@class Gd.Attribute_Board:Control
local Attribute_Board = {
    extends = Control,
}

function Attribute_Board:_ready()
    self:init()
end

function Attribute_Board:init()
    Action:init(self)
end

return Attribute_Board

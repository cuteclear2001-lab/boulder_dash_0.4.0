--res://lua/user_interface_layout/game_message/game_state_label/game_state_label_gd.lua
local Action = require("lua.user_interface_layout.game_message.game_state_label.game_state_label_action")

---@class Gd.Game_State_Label:Label
local Game_State_Label = {
    extends = Label,
}

function Game_State_Label:_ready()
    self:init()
end

function Game_State_Label:init()
    Action:init(self)
end

return Game_State_Label

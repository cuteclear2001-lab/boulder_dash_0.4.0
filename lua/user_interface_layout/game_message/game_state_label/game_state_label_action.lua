--res://lua/user_interface_layout/game_message/game_state_label/game_state_label_action.lua
local Data = require("lua.user_interface_layout.game_message.game_state_label.game_state_label_data")

---@class Action.Game_State_Label
local Game_State_Label = {
}

---@param label Label
function Game_State_Label:init(label)
    Data.label = label
end

---@param text string
function Game_State_Label:update(text)
    local label = Data.label
    label.text = text
end

return Game_State_Label

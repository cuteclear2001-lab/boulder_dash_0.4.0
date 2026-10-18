--res://lua/user_interface_layout/game_message/countdown_label/countdown_label_action.lua
local Data = require("lua.user_interface_layout.game_message.countdown_label.countdown_label_data")

---@class Action.Countdown_Label
local Countdown_Label = {
}

---@param label Label
function Countdown_Label:init(label)
    Data.label = label
end

---@param countdown float
function Countdown_Label:update(countdown)
    local label = Data.label
    local seconds = math.floor(countdown)
    local milliseconds = math.floor((countdown % 1) * 100)
    label.text = string.format("%02d.%02d", seconds, milliseconds)
end

return Countdown_Label

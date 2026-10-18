--res://lua/user_interface_layout/game_message/countdown_label/countdown_label_gd.lua
local Action = require("lua.user_interface_layout.game_message.countdown_label.countdown_label_action")

---@class Gd.Countdown_Label:Label
local Countdown_Label = {
    extends = Label,
}

function Countdown_Label:_ready()
    self:init()
end

function Countdown_Label:init()
    Action:init(self)
end

return Countdown_Label

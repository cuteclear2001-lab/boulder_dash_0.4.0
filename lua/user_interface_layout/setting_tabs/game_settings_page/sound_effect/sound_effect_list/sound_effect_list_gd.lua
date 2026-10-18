--res://lua/user_interface_layout/setting_tabs/game_settings_page/sound_effect/sound_effect_list/sound_effect_list_gd.lua
local Action = require("lua.user_interface_layout.setting_tabs.game_settings_page.sound_effect.sound_effect_list.sound_effect_list_action")

---@class Gd.Sound_Effect_List:HBoxContainer
local Sound_Effect_List = {
    extends = HBoxContainer,
}

function Sound_Effect_List:_ready()
    self:init()
end

function Sound_Effect_List:init()
    Action:init(self)
end

return Sound_Effect_List

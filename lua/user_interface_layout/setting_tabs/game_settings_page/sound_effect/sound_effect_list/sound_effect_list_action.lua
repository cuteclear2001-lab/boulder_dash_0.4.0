--res://lua/user_interface_layout/setting_tabs/game_settings_page/sound_effect/sound_effect_list/sound_effect_list_action.lua
local Data = require("lua.user_interface_layout.setting_tabs.game_settings_page.sound_effect.sound_effect_list.sound_effect_list_data")
local Main_H_Slider_Data = require("lua.user_interface_layout.setting_tabs.game_settings_page.sound_effect.main_h_slider.main_h_slider_data")

---@class Action.Sound_Effect_List
local Sound_Effect_List = {
}

---@param hBoxContainer HBoxContainer
function Sound_Effect_List:init(hBoxContainer)
    Data.hBoxContainer = hBoxContainer
    self:setup()
end

function Sound_Effect_List:setup()
    ---@type HBoxContainer
    local hBoxContainer = Data.hBoxContainer
    local button_count = Data.button_count
    for i = 1, button_count do
        local soundEffectCell = Data.resourceLoader:instantiate()
        if is_instance_valid(soundEffectCell) then
            local button = soundEffectCell:find_child("Button")
            local callable = Callable(function()self["onPressed"](self, i * button_count)end)
            button.pressed:connect(callable)
            hBoxContainer:add_child(soundEffectCell)
        end
    end
end

---@param value integer
function Sound_Effect_List:onPressed(value)
    ---@type HSlider
    local hSlider = Main_H_Slider_Data.hSlider
    hSlider:set_value(value)
end

return Sound_Effect_List

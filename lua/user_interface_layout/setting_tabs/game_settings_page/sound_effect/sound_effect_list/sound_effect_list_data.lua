--res://lua/user_interface_layout/setting_tabs/game_settings_page/sound_effect/sound_effect_list/sound_effect_list_data.lua
local H_SLIDER_BUTTON_TSCN_FILE = "res://tscn/user_interface_layout/cell/h_slider_button.tscn"

---@class Data.Sound_Effect_List
---@field hBoxContainer HBoxContainer | nil
---@field resourceLoader ResourceLoader | nil
---@field button_count integer
local Sound_Effect_List = {
    hBoxContainer = nil,
    resourceLoader = ResourceLoader:load(H_SLIDER_BUTTON_TSCN_FILE),
    button_count = 10,
}

return Sound_Effect_List

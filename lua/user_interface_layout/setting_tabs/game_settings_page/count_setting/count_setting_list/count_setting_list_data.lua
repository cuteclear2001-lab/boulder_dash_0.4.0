--res://lua/user_interface_layout/setting_tabs/game_settings_page/count_setting/count_setting_list/count_setting_list_data.lua
local H_SLIDER_BUTTON_TSCN_FILE = "res://tscn/user_interface_layout/cell/h_slider_button.tscn"

---@class Data.CountSettingList
---@field hBoxContainer HBoxContainer | nil
---@field resourceLoader ResourceLoader | nil
---@field button_count integer
local Count_Setting_List = {
    hBoxContainer = nil,
    resourceLoader = ResourceLoader:load(H_SLIDER_BUTTON_TSCN_FILE),
    button_count = 5,
}

return Count_Setting_List

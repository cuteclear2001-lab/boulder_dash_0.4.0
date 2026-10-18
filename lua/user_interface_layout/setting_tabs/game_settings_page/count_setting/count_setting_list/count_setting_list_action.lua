--res://lua/user_interface_layout/setting_tabs/game_settings_page/count_setting/count_setting_list/count_setting_list_action.lua
local Data = require("lua.user_interface_layout.setting_tabs.game_settings_page.count_setting.count_setting_list.count_setting_list_data")
local Main_H_Slider_Data = require("lua.user_interface_layout.setting_tabs.game_settings_page.count_setting.main_h_slider.main_h_slider_data")

---@class Action.CountSettingList
local Count_Setting_List = {
}

---@param hBoxContainer HBoxContainer
function Count_Setting_List:init(hBoxContainer)
    Data.hBoxContainer = hBoxContainer
    self:setup()
end

function Count_Setting_List:setup()
    ---@type HBoxContainer
    local hBoxContainer = Data.hBoxContainer
    local button_count = Data.button_count
    for i = 1, button_count do
        local countSettingCell = Data.resourceLoader:instantiate()
        if is_instance_valid(countSettingCell) then
            local button = countSettingCell:find_child("Button")
            local callable = Callable(function()self["onPressed"](self, i)end)
            button.pressed:connect(callable)
            hBoxContainer:add_child(countSettingCell)
        end
    end
end

---@param value integer
function Count_Setting_List:onPressed(value)
    ---@type HSlider
    local hSlider = Main_H_Slider_Data.hSlider
    hSlider:set_value(value)
end

return Count_Setting_List

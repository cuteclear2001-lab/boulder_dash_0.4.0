--res://lua/user_interface_layout/setting_tabs/input_settings_page/InputList/input_list_data.lua
local INPUT_CELL = "res://tscn/user_interface_layout/setting_tabs/input_settings_page/input_cell.tscn"

---@class Data.Input_List
---@field vBoxContainer VBoxContainer | nil
---@field input_action_cell ResourceLoader
---@field remapping_flag bool
---@field action_to_remap string | nil
---@field remapping_button Button | nil
local Input_List = {
    vBoxContainer = nil,
    input_action_cell = ResourceLoader:load(INPUT_CELL),
    remapping_flag = false,
    action_to_remap = nil,
    remapping_button = nil,
}

return Input_List

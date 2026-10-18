--res://lua/user_interface_layout/cave_difficulty_select/cave_list/cave_list_data.lua
local H_SLIDER_BUTTON_TSCN_FILE = "res://tscn/user_interface_layout/cell/h_slider_circle_button.tscn"

---@class Data.Cave_List
---@field hBoxContainer HBoxContainer | nil
---@field resourceLoader ResourceLoader
local Cave_List = {
    hBoxContainer = nil,
    resourceLoader = ResourceLoader:load(H_SLIDER_BUTTON_TSCN_FILE),
}

return Cave_List

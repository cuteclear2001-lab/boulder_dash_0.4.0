--res://lua/user_interface_layout/cave_difficulty_select/difficulty_container/difficulty_container_data.lua
local DIFFICULTY_BUTTON_LIST_FILE = "res://tscn/user_interface_layout/cave_difficulty_select/difficulty_container/difficulty_button_list.tscn"
local DIFFICULTY_BUTTON_FILE = "res://tscn/user_interface_layout/cave_difficulty_select/difficulty_container/difficulty_button.tscn"

---@class Data.Difficulty_Container
---@field vBoxContainer VBoxContainer | nil
---@field difficulty_button_list_resource ResourceLoader
---@field difficulty_button_resource ResourceLoader
---@field on_pressed function | nil
local Difficulty_Container = {
    vBoxContainer = nil,
    difficulty_button_list_resource = ResourceLoader:load(DIFFICULTY_BUTTON_LIST_FILE),
    difficulty_button_resource = ResourceLoader:load(DIFFICULTY_BUTTON_FILE),
    on_pressed = nil,
}

return Difficulty_Container

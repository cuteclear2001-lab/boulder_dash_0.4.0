--res://lua/user_interface_layout/setting_tabs/input_settings_page/InputList/input_list_gd.lua
local Action = require("lua.user_interface_layout.setting_tabs.input_settings_page.input_list.input_list_action")

---@class Gd.Input_List:VBoxContainer
local Input_List = {
    extends = VBoxContainer,
}

function Input_List:_ready()
    self:init()
end

function Input_List:init()
    Action:init(self)
end

---@param event InputEvent
function Input_List:_input(event)
    Action:input(event)
end

return Input_List

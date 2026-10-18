--res://lua/user_interface_layout/setting_tabs/input_settings_page/reset_to_default_button_action.lua
local Data = require("lua.user_interface_layout.setting_tabs.input_settings_page.reset_button.reset_button_data")
local User_Setting = require("lua.feature.data.user_setting")
local Config = require("lua.feature.action.config")
local Input_List_Action = require("lua.user_interface_layout.setting_tabs.input_settings_page.input_list.input_list_action")
local Bind_Control = require("lua.feature.action.bind_control")

---@class Action.Input_Settings.Reset_Button
local Reset_Button = {
}

---@param button Button
function Reset_Button:init(button)
    Data.button = button
    self:setup()
end

function Reset_Button:setup()
    ---@type Button
    local button = Data.button
    local callable = Callable(function()self["onPressed"](self)end)
    button.pressed:connect(callable)
end

function Reset_Button:onPressed()
    local temp = Config:deepCopy(Config:loadDefault()[User_Setting.CONTROLS])
    Config:load()[User_Setting.CONTROLS] = temp
    Config:save()
    Bind_Control:init()
    Input_List_Action:setup()
end

return Reset_Button

--res://lua/user_interface_layout/setting_tabs/input_settings_page/InputList/input_list_action.lua
local Data = require("lua.user_interface_layout.setting_tabs.input_settings_page.input_list.input_list_data")
local Config = require("lua.feature.action.config")
local User_Setting = require("lua.feature.data.user_setting")

---@class Action.Input_List
local Input_List = {
}

---@param vBoxContainer VBoxContainer
function Input_List:init(vBoxContainer)
    Data.vBoxContainer = vBoxContainer
    self:setup()
end

function Input_List:setup()
    if Data.remapping_flag then
        return
    end
    local children = Data.vBoxContainer:get_children()
    for _, v in pairs(children) do
        if is_instance_valid(v) then
            v:queue_free()
        end
    end
    local input_list = Config:load()[User_Setting.CONTROLS]
    for _, v in ipairs(User_Setting.CONTROL_ORDERED_KEYS) do
        local k = input_list[v]
        local button = Data.input_action_cell:instantiate()
        if is_instance_valid(button) then
            local label_key = button:find_child("KeyLabel")
            local label_name = button:find_child("NameLabel") -- key code
            label_key.text = string.format("TR_%s", string.upper(v))
            local events = InputMap:action_get_events(v)
            if events:size() > 0 then
                label_name.text = k -- events[0]:as_text()
            else
                label_name.text = "?"
            end
            --Callable(function()self["onPressed"](self)end)
--            local callable = Callable(Data.vBoxContainer, "onButtonPressed"):bind(button, v)
            local callable = Callable(function()self["onButtonPressed"](self, button, v)end)
            button.pressed:connect(callable)
            Data.vBoxContainer:add_child(button)
        end
    end
end

---@param button Button
---@param action_name string
function Input_List:onButtonPressed(button, action_name)
    Data.action_to_remap = action_name
    Data.remapping_button = button
    button:find_child("NameLabel").text = "TR_PRESS_KEY"
    Data.remapping_flag = true
end

---@param event InputEvent
function Input_List:input(event)
    if not Data.remapping_flag then
        return
    end
    if event:is_class("InputEventKey") or (event:is_class("InputEventMouseButton") and event.pressed) then
        if event:is_class("InputEventMouseButton") and event.double_click then
            event.double_click = false
        end
        InputMap:action_erase_events(Data.action_to_remap)
        InputMap:action_add_event(Data.action_to_remap, event)
        local event_key = event:as_text() --- Left Mouse Button
        Config:saveSetting(User_Setting.CONTROLS, Data.action_to_remap, event_key)
        Data.remapping_button:find_child("NameLabel").text = event_key
        Data.remapping_flag = false
        Data.action_to_remap = nil
        Data.remapping_button = nil
        Data.vBoxContainer:accept_event()
    end
end

return Input_List

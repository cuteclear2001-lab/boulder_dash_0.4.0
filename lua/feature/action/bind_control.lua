--res://lua/feature/action/bind_control.lua
local User_Setting = require("lua.feature.data.user_setting")
local Config = require("lua.feature.action.config")

---@class Action.Bind_Control
local Bind_Control = {
}

function Bind_Control:init()
    local default_config = Config:loadDefault()[User_Setting.CONTROLS]
    local config = Config:load()[User_Setting.CONTROLS]
    for _, k in ipairs(User_Setting.CONTROL_ORDERED_KEYS) do
        local v = config[k]
        if not self:bind(k, v) then
            v = default_config[k]
            self:bind(k, v)
        end
    end
    for k, v in pairs(User_Setting.DEFAULT_CONTROLS) do
        self:bind(k, v)
    end
end

---@param action_name string
---@param key_code_string string
---@return bool
function Bind_Control:bind(action_name, key_code_string)
    local key_code = OS:find_keycode_from_string(key_code_string)
    ---@type InputEvent
    local new_event_key = nil
    if key_code == 0 then
        local temp = User_Setting.MOUSE_MAPPING_KEY[key_code_string]
        if temp ~= nil then
            key_code = temp
            new_event_key = InputEventMouseButton:new()
            new_event_key.button_index = key_code
        end
    else
        new_event_key = InputEventKey:new()
        new_event_key.keycode = key_code
    end
    if key_code == 0 or new_event_key == nil then
        return false
    end
    if not InputMap:has_action(action_name) then
        InputMap:add_action(action_name)
    else
        InputMap:action_erase_events(action_name)
    end
    InputMap:action_add_event(action_name, new_event_key)
--    print(string.format("%s, %s", action_name, tostring(new_event_key)))
    return true
end

return Bind_Control

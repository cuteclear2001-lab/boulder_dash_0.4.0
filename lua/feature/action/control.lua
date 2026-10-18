--res://lua/feature/action/control.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.feature.data.control")

---@class Action.Control
local Control = {
}

---@param event InputEvent
---@return bool
function Control:action(event)
    local flag = false
    for k, v in pairs(Data) do
        if event:is_action_pressed(k, false) then
            if type(v) == "function" then
                v()
            elseif type(v) == "table" then
                local object = v[Enum_Data.INVOKE.OBJECT]
                local arguments = v[Enum_Data.INVOKE.ARGUMENTS]
                if arguments == nil then
                    object:action()
                else
                    object:action(table.unpack(arguments))
                end
            end
            flag = true
        end
    end
    return flag
end

function Control:actionReleased()
    for k, v in pairs(Data) do
        if Input:is_action_just_released(k) then
            if type(v) == "function" then
                v()
            elseif type(v) == "table" then
                local object = v[Enum_Data.INVOKE.OBJECT]
                local arguments = v[Enum_Data.INVOKE.ARGUMENTS]
                if object.actionReleased == nil then
                    break
                end
                if arguments == nil then
                    object:actionReleased()
                else
                    object:actionReleased(table.unpack(arguments))
                end
            end
        end
    end
end

---@param delta float
function Control:actionDelta(delta)
    for k, v in pairs(Data) do
        if Input:is_action_pressed(k) then
            if type(v) == "function" then
                v()
            elseif type(v) == "table" then
                local object = v[Enum_Data.INVOKE.OBJECT]
                local arguments = v[Enum_Data.INVOKE.ARGUMENTS]
                if object.actionDelta == nil then
                    break
                end
                if arguments == nil then
                    object:actionDelta(delta)
                else
                    object:actionDelta(delta, table.unpack(arguments))
                end
            end
        end
    end
end

return Control

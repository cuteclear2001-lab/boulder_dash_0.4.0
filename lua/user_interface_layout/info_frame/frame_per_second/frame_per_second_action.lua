--res://lua/user_interface_layout/info_frame/frame_per_second/frame_per_second_action.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.user_interface_layout.info_frame.frame_per_second.frame_per_second_data")
local Calculator = require("lua.feature.action.calculator")

---@class Action.Frame_Per_Second
local Frame_Per_Second = {
}

---@param label Label
function Frame_Per_Second:init(label)
    Data.label = label
end

---@param delta float
function Frame_Per_Second:heart(delta)
    local label = Data.label
    if not is_instance_valid(label) then
        return
    end
    if not Data.begin_flag then
        label.text = string.format("%d", math.floor(1.0 / delta))
        Data.begin_flag = true
        return
    end
    Data.begin_time = Data.begin_time + delta
    Data.total_frames = Data.total_frames + 1
    if Data.begin_time >= Data.END_TIME then
        label.text = string.format("%d", math.floor(Data.total_frames / Data.END_TIME))
        Data.begin_time = Data.begin_time - Data.END_TIME
        Data.total_frames = 0
    end
end

return Frame_Per_Second

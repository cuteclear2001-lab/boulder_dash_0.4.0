--res://lua/user_interface_layout/info_frame/memory_label/memory_label_action.lua
local Data = require("lua.user_interface_layout.info_frame.memory_label.memory_label_data")

---@class Action.Memory_Label
local Memory_Label = {
}

---@param label Label
function Memory_Label:init(label)
    Data.label = label
end

---@param delta float
function Memory_Label:heart(delta)
    local label = Data.label
    if not is_instance_valid(label) then
        return
    end
    if not Data.begin_flag then
        label.text = string.format("%.2f", collectgarbage("count"))
        Data.begin_flag = true
        return
    end
    Data.begin_time = Data.begin_time + delta
    Data.tick_count = Data.tick_count + 1
    Data.memory_count = Data.memory_count + collectgarbage("count")
    if Data.begin_time >= Data.END_TIME then
        label.text = string.format("%.2f", Data.memory_count / Data.tick_count)
        Data.begin_time = Data.begin_time - Data.END_TIME
        Data.tick_count = 0
        Data.memory_count = .0
        collectgarbage("collect") -- ?
    end
end

return Memory_Label

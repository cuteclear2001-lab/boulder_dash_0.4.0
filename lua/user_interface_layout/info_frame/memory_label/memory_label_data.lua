--res://lua/user_interface_layout/info_frame/memory_label/memory_label_data.lua

---@class Data.Memory_Label
---@field label Label | nil
---@field END_TIME integer
---@field begin_flag bool
---@field begin_time float
---@field tick_count integer
---@field memory_count float
local Memory_Label = {
    label = nil,
    END_TIME = 1,
    begin_flag = false,
    begin_time = .0,
    tick_count = 0,
    memory_count = .0,
}

return Memory_Label

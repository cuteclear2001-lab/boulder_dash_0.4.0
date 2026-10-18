--res://lua/user_interface_layout/info_frame/performance_label/performance_label_data.lua

---@class Data.Performance_Label
---@field label Label | nil
---@field END_TIME integer
---@field begin_flag bool
---@field begin_time float
---@field tick_count integer
---@field performance_count float
---@field render_draw_calls integer
local Performance_Label = {
    label = nil,
    END_TIME = 1,
    begin_flag = false,
    begin_time = .0,
    tick_count = 0,
    performance_count = .0,
    render_draw_calls = 0,
}

return Performance_Label

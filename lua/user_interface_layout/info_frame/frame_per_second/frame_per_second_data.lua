--res://lua/user_interface_layout/info_frame/frame_per_second/frame_per_second_data.lua

---@class Data.Frame_Per_Second
---@field label Label | nil
---@field END_TIME integer
---@field begin_flag bool
---@field begin_time float
---@field total_frames integer
local Frame_Per_Second = {
    label = nil,
    END_TIME = 2,
    begin_flag = false,
    begin_time = .0,
    total_frames = 0
}

return Frame_Per_Second

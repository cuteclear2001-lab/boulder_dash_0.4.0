--res://lua/feature/data/object/camera_2d/camera_2d.lua

---@class Data.Camera_2D
---@field CAMERA_2D_FILE string
---@field camera_2d Camera2D | nil
---@field callback Callable | nil
---@field tween_position_list integer[][]
---@field moved_flag bool
---@field current_moved_tween Tween | nil
local Camera_2D = {
    CAMERA_2D_FILE = "res://tscn/object/camera_2d/camera_2d.tscn",
    camera_2d = nil,
    callback = nil,
    tween_position_list = {},
    moved_flag = false,
    current_moved_tween = nil,
--    position = {0, 0},
}

return Camera_2D

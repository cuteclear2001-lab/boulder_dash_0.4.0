--res://lua/feature/data/object/sprite/rockford.lua
local Enum_Data = require("lua.enum.enum_data")

---@class Data.Rockford
---@type table<SPRITE_TYPE, any>
local Rockford = {
    [Enum_Data.SPRITE_TYPE.SELF_DATA] = nil,
    [Enum_Data.SPRITE_TYPE.SELF_SPRITE] = nil,
    [Enum_Data.SPRITE_TYPE.TSCN_FILE] = "res://tscn/object/sprite/rockford.tscn",
    [Enum_Data.SPRITE_TYPE.LOAD_TSCN_FILE] = nil,
    [Enum_Data.SPRITE_TYPE.ACTION_TABLE] = {
        [Enum_Data.ROCKFORD_ACTION.MOVE_UP] = "move_up",
        [Enum_Data.ROCKFORD_ACTION.MOVE_DOWN] = "move_down",
        [Enum_Data.ROCKFORD_ACTION.MOVE_LEFT] = "move_left",
        [Enum_Data.ROCKFORD_ACTION.MOVE_RIGHT] = "move_right",
    },
    [Enum_Data.SPRITE_TYPE.ROCKFORD_MOVED_TABLE] = nil,
    -- [Enum_Data.SPRITE_TYPE.DATA_TABLE] = {
    --     [Enum_Data.ROCKFORD_MOVED_TYPE.MOVED_BUFFER] = nil,
    --     [Enum_Data.ROCKFORD_MOVED_TYPE.MOVED_BUFFER_TIME_BEGIN] = .0,
    -- },
    -- ROCKFORD_FILE = "res://tscn/object/sprite/rockford.tscn",
    -- sprite2d = nil,
    -- position = {0, 0},
    -- previous_position = {1, 1},
    -- moving_flag = false,
    -- moved_buffer = nil,
    -- moved_buffer_time_begin = .0,
    -- callback = nil,
}

return Rockford

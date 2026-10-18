--res://lua/feature/data/direction.lua
local Enum_Data = require("lua.enum.enum_data")

---@class Direction
local Direction = {
    [Enum_Data.MOVE.LEFT] = {-1, 0},
    [Enum_Data.MOVE.RIGHT] = {1, 0},
    [Enum_Data.MOVE.UP] = {0, -1},
    [Enum_Data.MOVE.DOWN] = {0, 1},
}

return Direction

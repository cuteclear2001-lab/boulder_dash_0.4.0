--res://lua/feature/data/command/rockford_move.lua
local Enum_Data = require("lua.enum.enum_data")
--local Rockford = require("lua.feature.action.object.rockford")

---@class Data.Rockford_Move
local Rockford_Move = {
    [Enum_Data.ROCKFORD_COMMAND_MOVED_TYPE.MOVED_TYPE] = {
        [Enum_Data.MOVE.UP] = "up",
        [Enum_Data.MOVE.DOWN] = "down",
        [Enum_Data.MOVE.LEFT] = "left",
        [Enum_Data.MOVE.RIGHT] = "right",
    },
    -- [Enum_Data.ROCKFORD_COMMAND_MOVED_TYPE.COMMAND_MOVE_BUFFER] = {
    --     [Enum_Data.MOVE.UP] = false,
    --     [Enum_Data.MOVE.DOWN] = false,
    --     [Enum_Data.MOVE.LEFT] = false,
    --     [Enum_Data.MOVE.RIGHT] = false,
    -- },
}

return Rockford_Move

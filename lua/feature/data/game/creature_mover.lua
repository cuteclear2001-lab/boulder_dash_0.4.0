--res://lua/feature/data/game/creature_mover.lua
local Enum_Data = require("lua.enum.enum_data")

---@class Data.Creature_mover
---@type table<CREATURE_MOVER_TYPE, any>
local Creature_mover = {
    [Enum_Data.CREATURE_MOVER_TYPE.CAN_MOVE_CREATURE] = {Enum_Data.BLOCK.SKELETON, Enum_Data.BLOCK.BAT,},
    [Enum_Data.CREATURE_MOVER_TYPE.CHECK_DIRECTION] = {
        -- [Enum_Data.MOVE.UP] = Enum_Data.MOVE.RIGHT,
        -- [Enum_Data.MOVE.RIGHT] = Enum_Data.MOVE.DOWN,
        -- [Enum_Data.MOVE.DOWN] = Enum_Data.MOVE.LEFT,
        -- [Enum_Data.MOVE.LEFT] = Enum_Data.MOVE.UP,
        [Enum_Data.MOVE.UP] = {Enum_Data.MOVE.RIGHT, Enum_Data.MOVE.UP , Enum_Data.MOVE.LEFT, Enum_Data.MOVE.DOWN},
        [Enum_Data.MOVE.LEFT] = {Enum_Data.MOVE.UP, Enum_Data.MOVE.LEFT, Enum_Data.MOVE.DOWN, Enum_Data.MOVE.RIGHT},
        [Enum_Data.MOVE.DOWN] = {Enum_Data.MOVE.LEFT, Enum_Data.MOVE.DOWN, Enum_Data.MOVE.RIGHT, Enum_Data.MOVE.UP},
        [Enum_Data.MOVE.RIGHT] = {Enum_Data.MOVE.DOWN, Enum_Data.MOVE.RIGHT, Enum_Data.MOVE.UP, Enum_Data.MOVE.LEFT},
    },
}

return Creature_mover

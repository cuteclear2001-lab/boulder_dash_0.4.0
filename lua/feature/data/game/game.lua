--res://lua/feature/data/game/game.lua
local Enum_Data = require("lua.enum.enum_data")

---@class Data.Game
---@type table<CAVE_TYPE, any>
local Game = {
    [Enum_Data.CAVE_TYPE.CURRENT_STATE] = Enum_Data.GAME_STATE.UNSELECTED,
    [Enum_Data.CAVE_TYPE.CAVE] = 0,
    [Enum_Data.CAVE_TYPE.DIFFICULTY] = 0,
    [Enum_Data.CAVE_TYPE.CURRENT_TIME] = .0,
    [Enum_Data.CAVE_TYPE.MODULE_RESOURCE] = {
        [Enum_Data.MODULE_RESOURCE.DIAMONDS_REQUIRED] = 0,
        [Enum_Data.MODULE_RESOURCE.REMAINING_TIME] = 0,
        [Enum_Data.MODULE_RESOURCE.GROUND_DATA] = {},
        [Enum_Data.MODULE_RESOURCE.OBJECT_DATA] = {},
    },
    [Enum_Data.CAVE_TYPE.COUNTDOWN_TIME] = .0,
    [Enum_Data.CAVE_TYPE.LOAD_FLAG] = false,
    [Enum_Data.CAVE_TYPE.PAUSE_FLAG] = false,
    [Enum_Data.CAVE_TYPE.SPRITE_QUERY_BLOCK]
        = {
            Enum_Data.BLOCK.ROCKFORD,
            Enum_Data.BLOCK.BOULDER,
            Enum_Data.BLOCK.DIAMOND,
            Enum_Data.BLOCK.EXIT_DOOR,
            Enum_Data.BLOCK.SKELETON,
            Enum_Data.BLOCK.BAT,
            Enum_Data.BLOCK.BOMB,
        },
}

return Game

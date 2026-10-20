--res://lua/feature/data/game/bomber.lua
local Enum_Data = require("lua.enum.enum_data")

---@class Data.Bomber
---@type table<BOMBER_TYPE, any>
local Bomber = {
    [Enum_Data.BOMBER_TYPE.CAN_BOMB_SPRITE] = {Enum_Data.BLOCK.ROCKFORD, Enum_Data.BLOCK.BAT, Enum_Data.BLOCK.SKELETON, },
    [Enum_Data.BOMBER_TYPE.BOULDER_BOMBED_SPRITE] = {Enum_Data.BLOCK.ROCKFORD, Enum_Data.BLOCK.BOULDER, Enum_Data.BLOCK.DIAMOND, },
    [Enum_Data.BOMBER_TYPE.ROCKFORD_BOMBED_SPRITE] = {Enum_Data.BLOCK.BOULDER, Enum_Data.BLOCK.DIAMOND, },
    [Enum_Data.BOMBER_TYPE.BOMB_SQUARE_ADDED_LENGTH] = 1,
    [Enum_Data.BOMBER_TYPE.UNBOMB_BLOCK] = {Enum_Data.BLOCK.STEEL_WALL, Enum_Data.BLOCK.EXIT_DOOR},
    [Enum_Data.BOMBER_TYPE.GAME_OVER_ACTION] = nil
}

return Bomber

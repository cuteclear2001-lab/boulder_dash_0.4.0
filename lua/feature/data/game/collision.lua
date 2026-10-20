--res://lua/feature/data/game/collision.lua
local Enum_Data = require("lua.enum.enum_data")

---@class Data.Collision
---@field Enum_Data.COLLISION_TYPE.ROCKFORD table<BLOCK>
---@field Enum_Data.COLLISION_TYPE.ANOTHER table<BLOCK>
local Collision = {
    [Enum_Data.COLLISION_TYPE.ROCKFORD] = {Enum_Data.BLOCK.BRICK_WALL, Enum_Data.BLOCK.ICE_BRICK_WALL, Enum_Data.BLOCK.STEEL_WALL, Enum_Data.BLOCK.BOULDER, Enum_Data.BLOCK.BOMB},
    [Enum_Data.COLLISION_TYPE.CREATURE] = {Enum_Data.BLOCK.BRICK_WALL, Enum_Data.BLOCK.ICE_BRICK_WALL, Enum_Data.BLOCK.STEEL_WALL ,Enum_Data.BLOCK.DIRT ,Enum_Data.BLOCK.ICE_DIRT, Enum_Data.BLOCK.EXIT_DOOR, Enum_Data.BLOCK.BOULDER, Enum_Data.BLOCK.DIAMOND, Enum_Data.BLOCK.SKELETON, Enum_Data.BLOCK.BAT, Enum_Data.BLOCK.BOMB},
    [Enum_Data.COLLISION_TYPE.BOULDER] = {Enum_Data.BLOCK.BRICK_WALL, Enum_Data.BLOCK.ICE_BRICK_WALL, Enum_Data.BLOCK.STEEL_WALL ,Enum_Data.BLOCK.DIRT ,Enum_Data.BLOCK.ICE_DIRT, Enum_Data.BLOCK.EXIT_DOOR, Enum_Data.BLOCK.BOULDER, Enum_Data.BLOCK.DIAMOND, Enum_Data.BLOCK.BOMB},
    [Enum_Data.COLLISION_TYPE.PUSH_BOULDER] = {Enum_Data.BLOCK.BRICK_WALL, Enum_Data.BLOCK.ICE_BRICK_WALL, Enum_Data.BLOCK.STEEL_WALL ,Enum_Data.BLOCK.DIRT ,Enum_Data.BLOCK.ICE_DIRT, Enum_Data.BLOCK.EXIT_DOOR, Enum_Data.BLOCK.BOULDER, Enum_Data.BLOCK.DIAMOND, Enum_Data.BLOCK.BOMB, Enum_Data.BLOCK.BAT, Enum_Data.BLOCK.SKELETON},
    [Enum_Data.COLLISION_TYPE.DIAMOND] = {Enum_Data.BLOCK.BRICK_WALL, Enum_Data.BLOCK.ICE_BRICK_WALL, Enum_Data.BLOCK.STEEL_WALL ,Enum_Data.BLOCK.DIRT ,Enum_Data.BLOCK.ICE_DIRT, Enum_Data.BLOCK.EXIT_DOOR, Enum_Data.BLOCK.BOULDER, Enum_Data.BLOCK.DIAMOND, Enum_Data.BLOCK.ROCKFORD, Enum_Data.BLOCK.BOMB},
}

return Collision

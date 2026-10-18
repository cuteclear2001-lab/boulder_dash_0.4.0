--res://lua/feature/data/object/sprite/manager.lua
local Enum_Data = require("lua.enum.enum_data")
local Rockford_Data = require("lua.feature.data.object.sprite.rockford")
local Exit_Door_Data = require("lua.feature.data.object.sprite.exit_door")
local Dirt_Data = require("lua.feature.data.object.sprite.dirt")
local Steel_Wall_Data = require("lua.feature.data.object.sprite.steel_wall")
local Brick_Wall_Data = require("lua.feature.data.object.sprite.brick_wall")
local Ice_Brick_Wall_Data = require("lua.feature.data.object.sprite.ice_brick_wall")
local Boulder_Data = require("lua.feature.data.object.sprite.boulder")
local Diamond_Data = require("lua.feature.data.object.sprite.diamond")
local Bomb_Data = require("lua.feature.data.object.sprite.bomb")
local Skeleton_Data = require("lua.feature.data.object.sprite.skeleton")
local Bat_Data = require("lua.feature.data.object.sprite.bat")

---@class Data.Manager
---@type table<SPRITE_MANAGER_TYPE, any>
local Manager = {
    [Enum_Data.SPRITE_MANAGER_TYPE.FRAME_OFFSET] = {10, 1},
    [Enum_Data.SPRITE_MANAGER_TYPE.BLOCK_TO_SPRITE_FRAME_INDEX]
        = {
            [Enum_Data.BLOCK.DIRT] = 1,
            [Enum_Data.BLOCK.BRICK_WALL] = 2,
            [Enum_Data.BLOCK.STEEL_WALL] = 3,
            [Enum_Data.BLOCK.BOULDER] = 6,
            [Enum_Data.BLOCK.DIAMOND] = 7,
            [Enum_Data.BLOCK.ICE_BRICK_WALL] = 9,
        },
    [Enum_Data.SPRITE_MANAGER_TYPE.SPRITE_MOUDLE]
        = {
            [Enum_Data.BLOCK.ROCKFORD] = nil,
            [Enum_Data.BLOCK.DIRT] = nil,
            [Enum_Data.BLOCK.BRICK_WALL] = nil,
            [Enum_Data.BLOCK.ICE_BRICK_WALL] = nil,
            [Enum_Data.BLOCK.STEEL_WALL] = nil,
            [Enum_Data.BLOCK.BOULDER] = nil,
            [Enum_Data.BLOCK.DIAMOND] = nil,
            [Enum_Data.BLOCK.EXIT_DOOR] = nil,
            [Enum_Data.BLOCK.SKELETON] = nil,
            [Enum_Data.BLOCK.BAT] = nil,
            [Enum_Data.BLOCK.BOMB] = nil,
        },
    [Enum_Data.SPRITE_MANAGER_TYPE.SPRITE_DATA]
        = {
            [Enum_Data.BLOCK.ROCKFORD] = Rockford_Data,
            [Enum_Data.BLOCK.EXIT_DOOR] = Exit_Door_Data,
            [Enum_Data.BLOCK.DIRT] = Dirt_Data,
            [Enum_Data.BLOCK.BRICK_WALL] = Brick_Wall_Data,
            [Enum_Data.BLOCK.ICE_BRICK_WALL] = Ice_Brick_Wall_Data,
            [Enum_Data.BLOCK.STEEL_WALL] = Steel_Wall_Data,
            [Enum_Data.BLOCK.BOULDER] = Boulder_Data,
            [Enum_Data.BLOCK.DIAMOND] = Diamond_Data,
            [Enum_Data.BLOCK.SKELETON] = Skeleton_Data,
            [Enum_Data.BLOCK.BAT] = Bat_Data,
            [Enum_Data.BLOCK.BOMB] = Bomb_Data,
        },
    [Enum_Data.SPRITE_MANAGER_TYPE.SPRITE_CLASS_TYPE]
        = {
            [Enum_Data.BLOCK.ROCKFORD] = Enum_Data.SPRITE_CLASS_TYPE.ANIMATED_SPRITE_2D,
            [Enum_Data.BLOCK.EXIT_DOOR] = Enum_Data.SPRITE_CLASS_TYPE.ANIMATED_SPRITE_2D,
            [Enum_Data.BLOCK.DIRT] = Enum_Data.SPRITE_CLASS_TYPE.SPRITE_2D,
            [Enum_Data.BLOCK.BRICK_WALL] = Enum_Data.SPRITE_CLASS_TYPE.SPRITE_2D,
            [Enum_Data.BLOCK.ICE_BRICK_WALL] = Enum_Data.SPRITE_CLASS_TYPE.SPRITE_2D,
            [Enum_Data.BLOCK.STEEL_WALL] = Enum_Data.SPRITE_CLASS_TYPE.SPRITE_2D,
            [Enum_Data.BLOCK.BOULDER] = Enum_Data.SPRITE_CLASS_TYPE.SPRITE_2D,
            [Enum_Data.BLOCK.DIAMOND] = Enum_Data.SPRITE_CLASS_TYPE.SPRITE_2D,
            [Enum_Data.BLOCK.SKELETON] = Enum_Data.SPRITE_CLASS_TYPE.ANIMATED_SPRITE_2D,
            [Enum_Data.BLOCK.BAT] = Enum_Data.SPRITE_CLASS_TYPE.ANIMATED_SPRITE_2D,
            [Enum_Data.BLOCK.BOMB] = Enum_Data.SPRITE_CLASS_TYPE.ANIMATED_SPRITE_2D,
        },
    [Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_LIST] = {},
    [Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_BLOCK] = 1,
    [Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_TILE_CELL] = 2,
    [Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_SPAWN_BLOCK] = 3,
}

return Manager

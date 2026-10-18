--res://lua/feature/data/draw/rect.lua
local Enum_Data = require("lua.enum.enum_data")
local Main_Data = require("lua.feature.data.main")
--local TILESET_PATH = "res://png/tileset.png"

---@class Rect
---@field block_to_rect table<BLOCK, RECT>
---@field tileset table<BLOCK, Rect2>
local Rect = {
    block_to_rect = {
        [Enum_Data.BLOCK.EMPTY] = Enum_Data.RECT.EMPTY,
        [Enum_Data.BLOCK.DIRT] = Enum_Data.RECT.DIRT,
        [Enum_Data.BLOCK.BRICK_WALL] = Enum_Data.RECT.BRICK_WALL,
        [Enum_Data.BLOCK.STEEL_WALL] = Enum_Data.RECT.STEEL_WALL,
        [Enum_Data.BLOCK.ICE_EMPTY] = Enum_Data.RECT.ICE_EMPTY,
        [Enum_Data.BLOCK.ICE_BRICK_WALL] = Enum_Data.RECT.ICE_BRICK_WALL,
    },
    tileset = {
        [Enum_Data.RECT.EMPTY] = Rect2(0, 0, Main_Data.BLOCK_SIZE, Main_Data.BLOCK_SIZE),
        [Enum_Data.RECT.DIRT] = Rect2(Main_Data.BLOCK_SIZE, 0, Main_Data.BLOCK_SIZE, Main_Data.BLOCK_SIZE),
        [Enum_Data.RECT.BRICK_WALL] = Rect2(Main_Data.BLOCK_SIZE * 2, 0, Main_Data.BLOCK_SIZE, Main_Data.BLOCK_SIZE),
        [Enum_Data.RECT.STEEL_WALL] = Rect2(Main_Data.BLOCK_SIZE * 3, 0, Main_Data.BLOCK_SIZE, Main_Data.BLOCK_SIZE),
        [Enum_Data.RECT.GEAR] = Rect2(Main_Data.BLOCK_SIZE * 4, 0, Main_Data.BLOCK_SIZE, Main_Data.BLOCK_SIZE),
        [Enum_Data.RECT.TIME] = Rect2(Main_Data.BLOCK_SIZE * 5, 0, Main_Data.BLOCK_SIZE, Main_Data.BLOCK_SIZE),
        [Enum_Data.RECT.BOULDER] = Rect2(Main_Data.BLOCK_SIZE * 6, 0, Main_Data.BLOCK_SIZE, Main_Data.BLOCK_SIZE),
        [Enum_Data.RECT.DIAMOND] = Rect2(Main_Data.BLOCK_SIZE * 7, 0, Main_Data.BLOCK_SIZE, Main_Data.BLOCK_SIZE),
        [Enum_Data.RECT.ICE_EMPTY] = Rect2(Main_Data.BLOCK_SIZE * 8, 0, Main_Data.BLOCK_SIZE, Main_Data.BLOCK_SIZE),
        [Enum_Data.RECT.ICE_BRICK_WALL] = Rect2(Main_Data.BLOCK_SIZE * 9, 0, Main_Data.BLOCK_SIZE, Main_Data.BLOCK_SIZE),
    },
}

return Rect

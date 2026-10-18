--res://lua/feature/data/object/sprite/brick_wall.lua
local Enum_Data = require("lua.enum.enum_data")

---@class Data.Brick_Wall
---@type table<SPRITE_TYPE, any>
local Brick_Wall = {
    [Enum_Data.SPRITE_TYPE.SPRITE_TABLE] = {},
}

return Brick_Wall
--res://lua/feature/data/object/sprite/dirt.lua
local Enum_Data = require("lua.enum.enum_data")

---@class Data.Dirt
---@type table<SPRITE_TYPE, any>
local Dirt = {
    [Enum_Data.SPRITE_TYPE.SPRITE_TABLE] = {},
}

return Dirt

--res://lua/feature/data/object/sprite/diamond.lua
local Enum_Data = require("lua.enum.enum_data")

---@class Data.Diamond
---@type table<SPRITE_TYPE, any>
local Diamond = {
    [Enum_Data.SPRITE_TYPE.SPRITE_TABLE] = {},
}

return Diamond
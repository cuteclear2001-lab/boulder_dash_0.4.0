--res://lua/feature/data/object/sprite/skeleton.lua
local Enum_Data = require("lua.enum.enum_data")

---@class Data.Skeleton
---@type table<SPRITE_TYPE, any>
local Skeleton = {
    [Enum_Data.SPRITE_TYPE.SPRITE_TABLE] = {},
    [Enum_Data.SPRITE_TYPE.TSCN_FILE] = "res://tscn/object/sprite/skeleton.tscn",
    [Enum_Data.SPRITE_TYPE.LOAD_TSCN_FILE] = nil,
    [Enum_Data.SPRITE_TYPE.ACTION_TABLE] = {},
}

return Skeleton

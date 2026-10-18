--res://lua/feature/data/object/sprite/exit_door.lua
local Enum_Data = require("lua.enum.enum_data")

---@class Data.Exit_Door
---@type table<SPRITE_TYPE, any>
local Exit_Door = {
    [Enum_Data.SPRITE_TYPE.SELF_DATA] = nil,
    [Enum_Data.SPRITE_TYPE.SELF_SPRITE] = nil,
    [Enum_Data.SPRITE_TYPE.TSCN_FILE] = "res://tscn/object/sprite/exit_door.tscn",
    [Enum_Data.SPRITE_TYPE.ACTION_TABLE] = {
        [Enum_Data.EXIT_DOOR_ACTION.IDLE] = "idle",
        [Enum_Data.EXIT_DOOR_ACTION.HEART] = "heart",
    },
}

return Exit_Door

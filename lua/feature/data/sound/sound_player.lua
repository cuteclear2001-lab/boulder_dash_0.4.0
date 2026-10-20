--res://lua/feature/data/sound/sound_player.lua
local Enum_Data = require("lua.enum.enum_data")

---@class Data.Sound_Player
local Sound_Player = {
    [Enum_Data.SOUND.LISTENER] = nil,
    [Enum_Data.SOUND.FILE_DATA]
        = {
            [Enum_Data.SOUND.SPRITE_STREAM_DATA] = {
                [Enum_Data.BLOCK.DIRT] = "res://sound/dug_dirt.wav",
                [Enum_Data.BLOCK.ICE_DIRT] = "res://sound/dug_dirt.wav",
                [Enum_Data.BLOCK.DIAMOND] = "res://sound/pickup_diamond.wav",
            },
            [Enum_Data.SOUND.SPRITE_FALL_STREAM_DATA] = {
                [Enum_Data.BLOCK.BOULDER] = "res://sound/boulder_fall.wav",
                [Enum_Data.BLOCK.DIAMOND] = "res://sound/diamond_fall.wav",
                [Enum_Data.BLOCK.EXIT_DOOR] = "res://sound/powerup.wav",
                [Enum_Data.BLOCK.BOMB] = "res://sound/explosion.wav",
            },
        },
    [Enum_Data.SOUND.SPRITE_STREAM_DATA] = {},
    [Enum_Data.SOUND.SPRITE_FALL_STREAM_DATA] = {},
}

return Sound_Player

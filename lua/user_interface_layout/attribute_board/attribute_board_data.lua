--res://lua/user_interface_layout/attribute_board/attribute_board_data.lua
local Enum_Data = require("lua.enum.enum_data")

---@class Data.Attribute_Board
---@field control Control | nil
local Attribute_Board = {
    control = nil,
    label = {
        [Enum_Data.ATTRIBUTE.SCORE] = {},
        [Enum_Data.ATTRIBUTE.GAME_LEVEL] = {},
        [Enum_Data.ATTRIBUTE.DIAMONDS_REQUIRED] = {},
        [Enum_Data.ATTRIBUTE.REMAINING_TIME] = {},
    },
    container = {
        [Enum_Data.ATTRIBUTE.SCORE] = "Score",
        [Enum_Data.ATTRIBUTE.GAME_LEVEL] = "GameLevel",
        [Enum_Data.ATTRIBUTE.DIAMONDS_REQUIRED] = "DiamondsRequired",
        [Enum_Data.ATTRIBUTE.REMAINING_TIME] = "RemainingTime",
    },
    label_name = {
        [Enum_Data.ATTRIBUTE.SCORE] = "Score",
        [Enum_Data.ATTRIBUTE.GAME_LEVEL] = "TR_LEVEL",
        [Enum_Data.ATTRIBUTE.DIAMONDS_REQUIRED] = "Require",
        [Enum_Data.ATTRIBUTE.REMAINING_TIME] = "Time",
    },
}

return Attribute_Board

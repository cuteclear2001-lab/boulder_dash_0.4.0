---res://lua/feature/data/object/cave/cave_difficulty.lua
local Enum_Data = require("lua.enum.enum_data")

---@class Data.Cave_Difficulty
---@field data_file_string string
---@field data table<integer, integer>
local Cave_Difficulty = {
    data_file_string = "lua/feature/data/object/cave/cave_%02d/difficulty_%03d",
    data = {
        [0] = 5,
        [1] = 5,
        -- [2] = 6,
        -- [3] = 7,
        -- [4] = 12,
        -- [5] = 22,
    },
    pause_game = nil,
}

return Cave_Difficulty

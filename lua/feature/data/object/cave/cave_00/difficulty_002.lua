--res://lua/feature/data/object/cave/cave_00/difficulty_002.lua
---@class Data.Cave00.Difficulty_002
---@field rockford_spawn_position table<integer ,integer>
---@field diamonds_required integer
---@field remaining_time integer
---@field data integer[][]
local Difficulty_002 = {
    diamonds_required = 1,
    remaining_time = 125,
    ground_data = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
    },
    object_data = {
        { 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 },
        { 4, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 4 },
        { 4, 0, 3, 3, 5, 0, 4, 0, 6, 6, 6, 0, 4 },
        { 4, 0, 6, 2, 2, 2, 0, 2, 2, 2, 2, 2, 4 },
        { 4, 0, 9, 0, 0, 0, 4, 0, 0, 0, 0, 0, 4 },
        { 4, 0, 3, 0, 0, 0, 4, 0, 0, 0, 0, 10, 4 },
        { 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 },
    },
}

return Difficulty_002

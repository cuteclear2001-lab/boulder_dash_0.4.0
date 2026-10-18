--res://lua/feature/data/object/cave/cave_00/difficulty_002.lua
---@class Data.Cave00.Difficulty_002
---@field rockford_spawn_position table<integer ,integer>
---@field diamonds_required integer
---@field remaining_time integer
---@field data integer[][]
local Difficulty_002 = {
--    rockford_spawn_position = {2, 2},
    diamonds_required = 3,
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
        { 4, 9, 2, 5, 2, 6, 2, 2, 0, 0, 2, 0, 4 },
        { 4, 0, 2, 8, 2, 7, 2, 2, 0, 0, 2, 0, 4 },
        { 4, 0, 2, 2, 0, 2, 0, 2, 0, 0, 2, 0, 4 },
        { 4, 0, 2, 3, 7, 2, 8, 2, 2, 0, 2, 0, 4 },
        { 4, 0, 2, 2, 2, 2, 2, 2, 0, 0, 2, 10, 4 },
        { 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 },
    },
}

return Difficulty_002

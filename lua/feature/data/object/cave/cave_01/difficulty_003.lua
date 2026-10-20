--res://lua/feature/data/object/cave/cave_01/difficulty_003.lua
---@class Data.Cave01.Difficulty_003
---@field rockford_spawn_position table<integer ,integer>
---@field diamonds_required integer
---@field remaining_time integer
---@field data integer[][]
local Difficulty_003 = {
    diamonds_required = 1,
    remaining_time = 125,
    ground_data = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
    },
    object_data = {
        { 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 },
        { 4, 9, 0, 0, 0, 0, 0, 0, 0, 4 },
        { 4, 0, 2, 2, 2, 2, 2, 2, 2, 4 },
        { 4, 0, 5, 0, 2, 0, 2, 2, 2, 4 },
        { 4, 0, 2, 0, 2, 0, 2, 2, 2, 4 },
        { 4, 0, 2, 7, 2, 0, 2, 2, 2, 4 },
        { 4, 0, 2, 2, 0, 0, 0, 5, 2, 4 },
        { 4, 0, 5, 8, 0, 3, 2, 2, 2, 4 },
        { 4, 0, 2, 2, 3, 2, 3, 3, 3, 4 },
        { 4, 0, 0, 0, 3, 0, 0, 0, 10, 4 },
        { 4, 4, 4, 4, 4, 4, 4, 4, 4, 4 },
    },
}

return Difficulty_003

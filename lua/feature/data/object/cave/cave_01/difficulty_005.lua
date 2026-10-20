--res://lua/feature/data/object/cave/cave_01/difficulty_005.lua
---@class Data.Cave01.Difficulty_005
---@field rockford_spawn_position table<integer ,integer>
---@field diamonds_required integer
---@field remaining_time integer
---@field data integer[][]
local Difficulty_005 = {
    diamonds_required = 9,
    remaining_time = 125,
    ground_data = {
        { 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1 },
        { 1, 1, 1, 1, 1, 1, 1 },
    },
    object_data = {
        { 4, 4, 4, 4, 4, 4, 4 },
        { 4, 9, 6, 6, 6, 6, 4 },
        { 4, 6, 6, 6, 6, 6, 4 },
        { 4, 6, 6, 6, 6, 6, 4 },
        { 4, 6, 6, 6, 6, 6, 4 },
        { 4, 6, 6, 6, 6, 10, 4 },
        { 4, 4, 4, 4, 4, 4, 4 },
    },
}

return Difficulty_005

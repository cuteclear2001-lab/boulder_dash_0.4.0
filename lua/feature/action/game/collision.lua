--res://lua/feature/action/game/collision.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.feature.data.game.collision")
local Game_Data = require("lua.feature.data.game.game")
local Calculator = require("lua.feature.action.calculator")
local checkCell = nil

---@class Collision
local Collision = {
}

---@param block BLOCK
---@param untouch_cells table<integer>
---@return bool
checkCell = function(block, untouch_cells)
    local flag = false
    for _, v in pairs(untouch_cells) do
        if block == v then
            return true
        end
    end
    return flag
end

---@param position table<integer, integer>
---@param collision_type COLLISION_TYPE
---@return bool
---@return BLOCK | nil
---@return AnimatedSprite2D | Sprite2D | nil
---@return table | nil
function Collision:check(position, collision_type)
    local flag = true
    local module_resource = Game_Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
    if module_resource == nil or not Game_Data[Enum_Data.CAVE_TYPE.LOAD_FLAG] then
        return flag, nil, nil, nil
    end
    local cave_data = module_resource[Enum_Data.MODULE_RESOURCE.GROUND_DATA]
    local cave_object_data = module_resource[Enum_Data.MODULE_RESOURCE.OBJECT_DATA]
    local cave_data_y = #cave_data
    local cave_data_x = #cave_data[1]
    local location_x = position[1]
    local location_y = position[2]
    local block = nil
    local sprite = nil
    local tile_cell = nil
    local tile_cell_object = nil
    if location_x >= 1 and location_x <= cave_data_x and location_y >= 1 and location_y <= cave_data_y then
        tile_cell = cave_object_data[location_y][location_x]
--        local position_a = tile_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
--        print(string.format("%s, (%d, %d)", "position= ", position_a[1], position_a[2]))
        tile_cell_object = tile_cell[Enum_Data.TILE_CELL_TYPE.LIST]
        for k, _ in pairs(tile_cell_object) do
            block, _ = Calculator:queryBlockType(k)
            ---@cast block BLOCK
            sprite = k
            flag = checkCell(block, Data[collision_type])
            if flag then
                return flag, block, sprite, tile_cell
            end
        end
        flag = false
    end
    return flag, block, sprite, tile_cell
end

return Collision

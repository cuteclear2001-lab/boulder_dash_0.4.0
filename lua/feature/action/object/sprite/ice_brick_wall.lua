--res://lua/feature/action/object/sprite/brick_wall.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.feature.data.object.sprite.ice_brick_wall")

---@class Action.Ice_Brick_Wall
local Ice_Brick_Wall = {
}

---@return Sprite2D
function Ice_Brick_Wall:query()
    local sprite2d = Sprite2D:new()
    local sprite_data = {
--        [Enum_Data.SPRITE_DATA.CURRENT_CELL] = tile_cell,
    }
    Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE][sprite2d] = sprite_data
    return sprite2d
end

---@param sprite Sprite2D
function Ice_Brick_Wall:freeObjectOfKey(sprite)
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    sprite:queue_free()
    data[sprite] = nil
end

function Ice_Brick_Wall:freeObject()
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    for k, _ in pairs(data) do
        k:queue_free()
        data[k] = nil
    end
end

return Ice_Brick_Wall
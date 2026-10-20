--res://lua/feature/action/object/sprite/ice_dirt.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.feature.data.object.sprite.ice_dirt")

---@class Action.Ice_Dirt
local Ice_Dirt = {
}

---@return Sprite2D
function Ice_Dirt:query()
    local sprite2d = Sprite2D:new()
    local sprite_data = {
--        [Enum_Data.SPRITE_DATA.CURRENT_CELL] = tile_cell,
    }
    Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE][sprite2d] = sprite_data
    return sprite2d
end

---@param sprite Sprite2D
function Ice_Dirt:freeObjectOfKey(sprite)
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    sprite:queue_free()
    data[sprite] = nil
end

function Ice_Dirt:freeObject()
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    for k, _ in pairs(data) do
--        print("free "..tostring(k))
        k:queue_free()
        data[k] = nil
    end
end

return Ice_Dirt

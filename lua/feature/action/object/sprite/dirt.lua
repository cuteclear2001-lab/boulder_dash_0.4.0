--res://lua/feature/action/object/sprite/dirt.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.feature.data.object.sprite.dirt")

---@class Action.Dirt
local Dirt = {
}

---@return Sprite2D
function Dirt:query()
    local sprite2d = Sprite2D:new()
    local sprite_data = {
--        [Enum_Data.SPRITE_DATA.CURRENT_CELL] = tile_cell,
    }
    Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE][sprite2d] = sprite_data
    return sprite2d
end

---@param sprite Sprite2D
function Dirt:freeObjectOfKey(sprite)
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    sprite:queue_free()
    data[sprite] = nil
end

function Dirt:freeObject()
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    for k, _ in pairs(data) do
--        print("free "..tostring(k))
        k:queue_free()
        data[k] = nil
    end
end

return Dirt

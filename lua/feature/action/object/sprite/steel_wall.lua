--res://lua/feature/action/object/sprite/steel_wall.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.feature.data.object.sprite.steel_wall")

---@class Action.Steel_Wall
local Steel_Wall = {
}

---@return Sprite2D
function Steel_Wall:query()
    local sprite2d = Sprite2D:new()
--    local position = {position_x, position_y}
    local sprite_data = {
--        [Enum_Data.SPRITE_DATA.CURRENT_CELL] = tile_cell,
    }
    Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE][sprite2d] = sprite_data
    return sprite2d
end

function Steel_Wall:freeObject()
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    for k, _ in pairs(data) do
--        print("free "..tostring(k))
        k:queue_free()
        data[k] = nil
    end
end

return Steel_Wall

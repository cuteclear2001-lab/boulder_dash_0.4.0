--res://lua/feature/action/object/sprite/boulder.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.feature.data.object.sprite.boulder")
local Game_Data = require("lua.feature.data.game.game")

---@class Action.Boulder
local Boulder = {
}

---@return Sprite2D
function Boulder:query()
    local sprite2d = Sprite2D:new()
    local sprite_data = {
--        [Enum_Data.SPRITE_DATA.CURRENT_CELL] = tile_cell,
    }
    Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE][sprite2d] = sprite_data
    return sprite2d
end

function Boulder:pauseObject()
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    local flag = Game_Data[Enum_Data.CAVE_TYPE.PAUSE_FLAG]
    for k, _ in pairs(data) do
        if flag then
            k.process_mode = Node.PROCESS_MODE_DISABLED
        else
            k.process_mode = Node.PROCESS_MODE_INHERIT
        end
    end
end

---@param sprite AnimatedSprite2D
function Boulder:freeObjectOfKey(sprite)
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    sprite:queue_free()
    data[sprite] = nil
end

function Boulder:freeObject()
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    for k, _ in pairs(data) do
        k:queue_free()
        data[k] = nil
    end
end

return Boulder
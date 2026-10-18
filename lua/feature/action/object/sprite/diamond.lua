--res://lua/feature/action/object/sprite/diamond.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.feature.data.object.sprite.diamond")
local Game_Data = require("lua.feature.data.game.game")

---@class Action.Diamond
local Diamond = {
}

---@return Sprite2D
function Diamond:query()
    local sprite2d = Sprite2D:new()
    local sprite_data = {
--        [Enum_Data.SPRITE_DATA.CURRENT_CELL] = tile_cell,
    }
    Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE][sprite2d] = sprite_data
    return sprite2d
end

---@param sprite AnimatedSprite2D
function Diamond:freeObjectOfKey(sprite)
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    sprite:queue_free()
    data[sprite] = nil
end

function Diamond:pauseObject()
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

function Diamond:freeObject()
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    for k, _ in pairs(data) do
        k:queue_free()
        data[k] = nil
    end
end

return Diamond
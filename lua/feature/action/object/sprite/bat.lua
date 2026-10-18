--res://lua/feature/action/object/sprite/bat.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.feature.data.object.sprite.bat")
local Game_Data = require("lua.feature.data.game.game")

---@class Action.Bat
local Bat = {
}

---@return AnimatedSprite2D
function Bat:query()
    local sprite2d = nil
    local load_tscn_file = Data[Enum_Data.SPRITE_TYPE.LOAD_TSCN_FILE]
    if not load_tscn_file then
        load_tscn_file = ResourceLoader:load(Data[Enum_Data.SPRITE_TYPE.TSCN_FILE])
        Data[Enum_Data.SPRITE_TYPE.ACTION_TABLE][Enum_Data.EXIT_DOOR_ACTION.HEART] = "heart"
    else
    end
    sprite2d = load_tscn_file:instantiate()
    local sprite_data = {[Enum_Data.CREATURE_SPRITE_TYPE.LAST_DIRECTION] = Enum_Data.MOVE.UP, }
    Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE][sprite2d] = sprite_data
    sprite2d:play(Data[Enum_Data.SPRITE_TYPE.ACTION_TABLE][Enum_Data.EXIT_DOOR_ACTION.HEART])
    return sprite2d
end

function Bat:pauseObject()
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
function Bat:freeObjectOfKey(sprite)
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    sprite:queue_free()
    data[sprite] = nil
end

function Bat:freeObject()
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    for k, _ in pairs(data) do
        k:queue_free()
        data[k] = nil
    end
end

return Bat

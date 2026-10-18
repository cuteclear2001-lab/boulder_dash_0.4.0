--res://lua/feature/action/object/sprite/bomb.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.feature.data.object.sprite.bomb")
local Game_Data = require("lua.feature.data.game.game")

---@class Action.Bomb
local Bomb = {
}

---@return AnimatedSprite2D
function Bomb:query()
    -- local sprite2d = Sprite2D:new()
    -- return sprite2d
    local sprite2d = nil
    local load_tscn_file = Data[Enum_Data.SPRITE_TYPE.LOAD_TSCN_FILE]
    if not load_tscn_file then
        load_tscn_file = ResourceLoader:load(Data[Enum_Data.SPRITE_TYPE.TSCN_FILE])
        Data[Enum_Data.SPRITE_TYPE.ACTION_TABLE][Enum_Data.EXIT_DOOR_ACTION.HEART] = "heart"
    else
    end
    sprite2d = load_tscn_file:instantiate()
    local sprite_data = {
--        [Enum_Data.SPRITE_DATA.CURRENT_CELL] = tile_cell,
    }
    Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE][sprite2d] = sprite_data
    -- if not sprite2d then
    --     sprite2d = ResourceLoader:load(Data[Enum_Data.SPRITE_TYPE.TSCN_FILE]):instantiate()
    --     Data[Enum_Data.SPRITE_TYPE.SELF_SPRITE] = sprite2d
    -- end
    sprite2d:play(Data[Enum_Data.SPRITE_TYPE.ACTION_TABLE][Enum_Data.EXIT_DOOR_ACTION.HEART])
    sprite2d.z_index = 2
    return sprite2d
end

function Bomb:pauseObject()
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
function Bomb:freeObjectOfKey(sprite)
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    sprite:queue_free()
    data[sprite] = nil
end

function Bomb:freeObject()
    local data = Data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    for k, _ in pairs(data) do
--        print("free "..tostring(k))
        k:queue_free()
        data[k] = nil
    end
end

return Bomb

--res://lua/feature/action/object/sprite/exit_door.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.feature.data.object.sprite.exit_door")
local Game_Data = require("lua.feature.data.game.game")
local Sound_Player = require("lua.feature.action.sound.sound_player")

---@class Action.Exit_Door
local Exit_Door = {
}

function Exit_Door:init()
end

---@return AnimatedSprite2D
function Exit_Door:query()
    local sprite2d = Data[Enum_Data.SPRITE_TYPE.SELF_SPRITE]
    if not sprite2d then
        sprite2d = ResourceLoader:load(Data[Enum_Data.SPRITE_TYPE.TSCN_FILE]):instantiate()
        Data[Enum_Data.SPRITE_TYPE.SELF_SPRITE] = sprite2d
    end
    sprite2d:play(Data[Enum_Data.SPRITE_TYPE.ACTION_TABLE][Enum_Data.EXIT_DOOR_ACTION.IDLE])
    return sprite2d
end

function Exit_Door:openDoor()
    local sprite_data = Data[Enum_Data.SPRITE_TYPE.SELF_DATA]
    local current_cell = sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL]
    if not current_cell then
        return
    end
    local current_position = current_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
    Sound_Player:playHasTileWithPosition(Enum_Data.BLOCK.EXIT_DOOR, current_position)
    local sprite = Data[Enum_Data.SPRITE_TYPE.SELF_SPRITE]
    sprite:play(Data[Enum_Data.SPRITE_TYPE.ACTION_TABLE][Enum_Data.EXIT_DOOR_ACTION.HEART])
end

function Exit_Door:closeDoor()
    local sprite = Data[Enum_Data.SPRITE_TYPE.SELF_SPRITE]
    sprite:play(Data[Enum_Data.SPRITE_TYPE.ACTION_TABLE][Enum_Data.EXIT_DOOR_ACTION.IDLE])
end

function Exit_Door:pauseObject()
    local sprite = Data[Enum_Data.SPRITE_TYPE.SELF_SPRITE]
    if is_instance_valid(sprite) then
        if Game_Data[Enum_Data.CAVE_TYPE.PAUSE_FLAG] then
            sprite.process_mode = Node.PROCESS_MODE_DISABLED
        else
            sprite.process_mode = Node.PROCESS_MODE_INHERIT
        end
    else
    end
end

function Exit_Door:freeObject()
end

return Exit_Door

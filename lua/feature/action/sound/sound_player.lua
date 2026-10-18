--res://lua/feature/action/sound/sound_player.lua
local Enum_Data = require("lua.enum.enum_data")
local Main_Data = require("lua.feature.data.main")
local Data = require("lua.feature.data.sound.sound_player")
local World_Data = require("lua.world_layout.world_data")
local Game_Data = require("lua.feature.data.game.game")
local Rockford_Data = require("lua.feature.data.object.sprite.rockford")
local Calculator = require("lua.feature.action.calculator")

---@class Action.Sound_Player
local Sound_Player = {
}

function Sound_Player:init()
    ---@type Node2D
    local world_node = World_Data.node2D
    local listener = AudioListener2D:new()
    world_node:add_child(listener)
    listener:make_current()
    Data[Enum_Data.SOUND.LISTENER] = listener
    local file_data = Data[Enum_Data.SOUND.FILE_DATA]
    if file_data == nil then
        return
    end
    local stream_data = Data[Enum_Data.SOUND.SPRITE_STREAM_DATA]
    local sprite_file_data = file_data[Enum_Data.SOUND.SPRITE_STREAM_DATA]
    for k, v in pairs(sprite_file_data) do
        local audioStream = ResourceLoader:load(v)
        local sound_player = AudioStreamPlayer2D:new()
        sound_player:set_stream(audioStream)
        sound_player:set_max_distance(Main_Data.SOUND_PLAYER_MAX_DISTANCE)
        stream_data[k] = sound_player
        world_node:add_child(sound_player)
    end
    stream_data = Data[Enum_Data.SOUND.SPRITE_FALL_STREAM_DATA]
    sprite_file_data = file_data[Enum_Data.SOUND.SPRITE_FALL_STREAM_DATA]
    for k, v in pairs(sprite_file_data) do
        local audioStream = ResourceLoader:load(v)
        local sound_player = AudioStreamPlayer2D:new()
        sound_player:set_stream(audioStream)
        sound_player:set_max_distance(Main_Data.SOUND_PLAYER_MAX_DISTANCE)
        stream_data[k] = sound_player
        world_node:add_child(sound_player)
    end
end

---@param block BLOCK
function Sound_Player:playHasTile(block)
    local stream_data = Data[Enum_Data.SOUND.SPRITE_STREAM_DATA]
    if stream_data == nil then
        return
    end
    local sprite_data = Rockford_Data[Enum_Data.SPRITE_TYPE.SELF_DATA]
    local current_cell = sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL]
    if not current_cell then
        return
    end
    local player = stream_data[block]
    if not player then
        return
    end
    local current_position = current_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
    local vector2 = Calculator:calcVector2(current_position[1], current_position[2])
    player:set_position(vector2)
    player:play()
end

---@param block BLOCK
---@param position table<integer, integer>
function Sound_Player:playHasTileWithPosition(block, position)
    local stream_data = Data[Enum_Data.SOUND.SPRITE_FALL_STREAM_DATA]
    if stream_data == nil then
        return
    end
    local player = stream_data[block]
    if not player then
        return
    end
    local vector2 = Calculator:calcVector2(position[1], position[2])
    player:set_position(vector2)
    player:play()
end

function Sound_Player:freeObject()
    local stream_data = Data[Enum_Data.SOUND.SPRITE_STREAM_DATA]
    if stream_data ~= nil then
        for k, v in pairs(stream_data) do
            v:queue_free()
            stream_data[k] = nil
        end
    end
    stream_data = Data[Enum_Data.SOUND.SPRITE_FALL_STREAM_DATA]
    if stream_data ~= nil then
        for k, v in pairs(stream_data) do
            v:queue_free()
            stream_data[k] = nil
        end
    end
end

return Sound_Player

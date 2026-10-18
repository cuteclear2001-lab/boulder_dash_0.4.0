--res://lua/feature/action/command/rockford_move.lua
local Enum_Data = require("lua.enum.enum_data")
local Game_Data = require("lua.feature.data.game.game")
--local Game_State_Data = require("lua.feature.data.game_state")
local Data = require("lua.feature.data.command.rockford_move")
local Rockford = require("lua.feature.action.object.sprite.rockford")

---@class Command.Rockford_Move
local Rockford_Move = {
}

---@param move_type MOVE
function Rockford_Move:action(move_type)
--    print(string.format("%s, %d", "Rockford_Move:action", move_type))
    if Game_Data[Enum_Data.CAVE_TYPE.CURRENT_STATE] == Enum_Data.GAME_STATE.GAMING then
        local moved_type = Data[Enum_Data.ROCKFORD_COMMAND_MOVED_TYPE.MOVED_TYPE]
        local v = moved_type[move_type]
        Rockford[v](Rockford)
    end
end

---@param move_type MOVE
function Rockford_Move:actionReleased(move_type)
--    print(string.format("%s, %d", "Rockford_Move:actionReleased", move_type))
end

---@param delta float
---@param move_type MOVE
function Rockford_Move:actionDelta(delta, move_type)
--    print(string.format("%s, %d, %f", "Rockford_Move:actionDelta", move_type, delta))
    if Game_Data[Enum_Data.CAVE_TYPE.CURRENT_STATE] == Enum_Data.GAME_STATE.GAMING then
        local moved_type = Data[Enum_Data.ROCKFORD_COMMAND_MOVED_TYPE.MOVED_TYPE]
        local v = moved_type[move_type]
        Rockford[v](Rockford)
    end
end

return Rockford_Move

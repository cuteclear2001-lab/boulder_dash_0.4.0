--res://lua/feature/action/game/pusher.lua
local Enum_Data = require("lua.enum.enum_data")
local Main_Data = require("lua.feature.data.main")
local Direction = require("lua.feature.data.direction")
local Collision = require("lua.feature.action.game.collision")
local Move_Tweener = require("lua.feature.action.game.move_tweener")
local tweenCallback = nil
local tryHorizontalTween = nil

---@class Action.Pusher
local Pusher = {
}

---@param sprite Sprite2D
---@param sprite_data table
tweenCallback = function(sprite, sprite_data)
    sprite_data[Enum_Data.SPRITE_DATA.MOVED_FLAG] = false
    local current_cell = sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL]
    local current_cell_list = current_cell[Enum_Data.TILE_CELL_TYPE.LIST]
    current_cell_list[sprite] = nil
    sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL] = sprite_data[Enum_Data.SPRITE_DATA.TARGET_CELL]
    sprite_data[Enum_Data.SPRITE_DATA.TARGET_CELL] = nil
end

tryHorizontalTween = function(sprite, sprite_data, target_cell)
    local callback = Callable(
        function()
            tweenCallback(sprite, sprite_data)
        end)
    Move_Tweener:tryTween(sprite, sprite_data, target_cell, Main_Data.ROCKFORD_PUSH_DURATION, callback)
end

---@param block BLOCK
---@param current_position table<integer, integer>
---@param direction MOVE
---@param sprite Sprite2D
---@param tile_cell table
---@return bool
function Pusher:tryPush(block, current_position, direction, sprite, tile_cell)
    local flag = false
    if Enum_Data.BLOCK.BOULDER == block then
        if Enum_Data.MOVE.LEFT == direction or Enum_Data.MOVE.RIGHT == direction then
            local sprite_data = tile_cell[Enum_Data.TILE_CELL_TYPE.LIST][sprite]
            if sprite_data then
                if sprite_data[Enum_Data.SPRITE_DATA.MOVED_FLAG] then
                    return flag
                else
                end
--                print("m_f, "..tostring(sprite_data[Enum_Data.SPRITE_DATA.MOVED_FLAG]))
            else
                return flag
            end
            local offset = Direction[Enum_Data.MOVE.DOWN]
            local target_position = {current_position[1] + offset[1], current_position[2] + offset[2]}
            local collision_flag, _, _, _ = Collision:check(target_position, Enum_Data.COLLISION_TYPE.BOULDER)
            if not collision_flag then
                return flag
            else
            end
            offset = Direction[direction]
            target_position = {current_position[1] + offset[1], current_position[2] + offset[2]}
            local target_tile_cell = nil
            collision_flag, _, _, target_tile_cell = Collision:check(target_position, Enum_Data.COLLISION_TYPE.BOULDER)
            if not collision_flag then
                if tile_cell then
                    tryHorizontalTween(sprite, sprite_data, target_tile_cell)
                    flag = true
--                    print(string.format("%s, %s, ", "pusher", tostring(target_tile_cell_object)))
                else
                end
            else
            end
        else
        end
    else
    end
    return flag
end

return Pusher

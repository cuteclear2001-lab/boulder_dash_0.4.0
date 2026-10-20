--res://lua/feature/action/game/droper.lua
local Enum_Data = require("lua.enum.enum_data")
local Main_Data = require("lua.feature.data.main")
local Data = require("lua.feature.data.game.droper")
local Direction = require("lua.feature.data.direction")
local Game_Data = require("lua.feature.data.game.game")
local Calculator = require("lua.feature.action.calculator")
local Collision = require("lua.feature.action.game.collision")
local Move_Tweener = require("lua.feature.action.game.move_tweener")
local Sound_Player = require("lua.feature.action.sound.sound_player")
local checkData = nil
local checkHorizontal = nil
local tryFallTween = nil
local tweenCallback = nil

---@class Action.Droper
local Droper = {
}

function Droper:init()
end

---@param sprite Sprite2D
---@param sprite_data table
---@param move MOVE
---@param collision_type COLLISION_TYPE
tweenCallback = function(sprite, sprite_data, move, collision_type)
    sprite_data[Enum_Data.SPRITE_DATA.MOVED_FLAG] = false
    local current_cell = sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL]
    local current_cell_list = current_cell[Enum_Data.TILE_CELL_TYPE.LIST]
    current_cell_list[sprite] = nil
    sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL] = sprite_data[Enum_Data.SPRITE_DATA.TARGET_CELL]
    sprite_data[Enum_Data.SPRITE_DATA.TARGET_CELL] = nil
    current_cell = sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL] -- ?
    local current_position = current_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
    local offset = Direction[move] -- ?
    local target_position = {current_position[1] + offset[1], current_position[2] + offset[2]}
    local flag, _, _, _ = Collision:check(target_position, Enum_Data.COLLISION_TYPE.DIAMOND)
    if flag then
        local block, _ = Calculator:queryBlockType(sprite)
        if not block then
            return
        end
        Sound_Player:playHasTileWithPosition(block, current_position)
--        print(string.format("%s, [%d, %d], [%d]", "position", current_position[1], current_position[2], block))
    end
end

---@param sprite Sprite2D
---@param sprite_data table
---@param tile_cell table
---@param move MOVE
---@param collision_type COLLISION_TYPE
tryFallTween = function(sprite, sprite_data, tile_cell, move, collision_type)
--    print(string.format("%s, (%d, %d), %s", "droper?", target_position[1], target_position[2], tostring(sprite)))
--Enum_Data.MOVE.DOWN
    local duration = nil
    if Enum_Data.MOVE.DOWN == move then
        duration = Main_Data.SPRITE_FALL_DURATION
    elseif Enum_Data.MOVE.LEFT == move or Enum_Data.MOVE.RIGHT == move then
        duration = Main_Data.SPRITE_HORIZONTAL_DURATION
    else
        return
    end
    local callback = Callable(
        function()
            tweenCallback(sprite, sprite_data, move, collision_type)
        end)
    Move_Tweener:tryTween(sprite, sprite_data, tile_cell, duration, callback)
end

---@param position table<integer, integer>
---@param move MOVE
---@param collision_type COLLISION_TYPE
---@return table | nil
checkHorizontal = function(position, move, collision_type)
    local offset = Direction[move]
    local target_position = {position[1] + offset[1], position[2] + offset[2]}
    local collision_flag, _, _, target_cell = Collision:check(target_position, collision_type)
    if not collision_flag then
        offset = Direction[Enum_Data.MOVE.DOWN]
        target_position = {target_position[1] + offset[1], target_position[2] + offset[2]}
        collision_flag, _, _, _ = Collision:check(target_position, collision_type)
        if not collision_flag then
            -- print(string.format("%s, %d", "checkHorizontal", collision_type))
            return target_cell
        else
        end
    end
    return nil
end

---@param module_resource table<CAVE_TYPE, any>
checkData = function(module_resource)
--    local cave_data = module_resource[Enum_Data.MODULE_RESOURCE.GROUND_DATA]
    local cave_object_data = module_resource[Enum_Data.MODULE_RESOURCE.OBJECT_DATA]
    local cave_data_y = #cave_object_data
    local cave_data_x = #cave_object_data[1]
    for y = cave_data_y - 1, 1, -1 do
        local row = cave_object_data[y]
        for x = 2, cave_data_x - 1 do
--            local tile_cell = cave_object_data[location_y][location_x]
            local tile_cell = row[x]
            local current_position = tile_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
            local offset = Direction[Enum_Data.MOVE.DOWN]
            local target_position = {current_position[1] + offset[1], current_position[2] + offset[2]}
            local tile_cell_object = tile_cell[Enum_Data.TILE_CELL_TYPE.LIST]
            for sprite2d, sprite_data in pairs(tile_cell_object) do
                local block, _ = Calculator:queryBlockType(sprite2d)
                if Enum_Data.BLOCK.BOULDER == block or Enum_Data.BLOCK.DIAMOND == block then
                    local moved_flag = sprite_data[Enum_Data.SPRITE_DATA.MOVED_FLAG]
                    if not moved_flag then
                        local collision_flag = true
                        local target_cell = nil
                        local collision_type = Enum_Data.COLLISION_TYPE.DIAMOND
                        if Enum_Data.BLOCK.BOULDER == block then
                            collision_type = Enum_Data.COLLISION_TYPE.BOULDER
                        elseif Enum_Data.BLOCK.DIAMOND == block then
                            collision_type = Enum_Data.COLLISION_TYPE.DIAMOND
                        else
                        end
                        collision_flag, block, _, target_cell = Collision:check(target_position, collision_type)
                        -- if Enum_Data.BLOCK.BOULDER == block then
                        --     collision_type = Enum_Data.COLLISION_TYPE.BOULDER
                        -- elseif Enum_Data.BLOCK.DIAMOND == block then
                        --     collision_type = Enum_Data.COLLISION_TYPE.DIAMOND
                        -- else
                        -- end
                        if not collision_flag then
                            if target_cell then
                                tryFallTween(sprite2d, sprite_data, target_cell, Enum_Data.MOVE.DOWN, collision_type)
                            else
                            end
                        else
                            if Enum_Data.BLOCK.BOULDER == block or Enum_Data.BLOCK.DIAMOND == block then
                                target_cell = checkHorizontal(current_position, Enum_Data.MOVE.LEFT, collision_type)
                                if target_cell then
                                    tryFallTween(sprite2d, sprite_data, target_cell, Enum_Data.MOVE.LEFT, collision_type)
                                else
                                    target_cell = checkHorizontal(current_position, Enum_Data.MOVE.RIGHT, collision_type)
                                    if target_cell then
                                        tryFallTween(sprite2d, sprite_data, target_cell, Enum_Data.MOVE.RIGHT, collision_type)
                                    else
                                    end
                                end
                            end
                        end
                    end
                elseif Enum_Data.BLOCK.ROCKFORD == block then
--                    print(string.format("%s, (%d, %d), %d", "droper?", position[1], position[2], block))
                end
            end
        end
    end
end

---@param delta float
function Droper:heart(delta)
    if Game_Data[Enum_Data.CAVE_TYPE.CURRENT_STATE] == Enum_Data.GAME_STATE.GAMING then
        local module_resource = Game_Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
        if module_resource == nil or not Game_Data[Enum_Data.CAVE_TYPE.LOAD_FLAG] then
            return
        end
        checkData(module_resource)
    end
    -- local location_x = position[1]
    -- local location_y = position[2]
    -- if location_x >= 1 and location_x <= cave_data_x and location_y >= 1 and location_y <= cave_data_y then
    -- end
end

return Droper

--res://lua/feature/action/game/creature_mover.lua
local Enum_Data = require("lua.enum.enum_data")
local Main_Data = require("lua.feature.data.main")
local Data = require("lua.feature.data.game.creature_mover")
local Sprite_Manager_Data = require("lua.feature.data.object.sprite.manager")
local Direction = require("lua.feature.data.direction")
local Game_Data = require("lua.feature.data.game.game")
local Calculator = require("lua.feature.action.calculator")
local Collision = require("lua.feature.action.game.collision")
local Move_Tweener = require("lua.feature.action.game.move_tweener")
local tweenCallback = nil
local tryMove = nil
local checkData = nil
local checkCreature = nil

---@class Action.Creature_mover
local Creature_mover = {
}

function Creature_mover:init()
end

---@param sprite AnimatedSprite2D
---@param sprite_data table
tweenCallback = function(sprite, sprite_data)
    sprite_data[Enum_Data.SPRITE_DATA.MOVED_FLAG] = false
    local current_cell = sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL]
    local current_cell_list = current_cell[Enum_Data.TILE_CELL_TYPE.LIST]
    current_cell_list[sprite] = nil
    sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL] = sprite_data[Enum_Data.SPRITE_DATA.TARGET_CELL]
    sprite_data[Enum_Data.SPRITE_DATA.TARGET_CELL] = nil
end

---@param sprite AnimatedSprite2D
---@param sprite_data table<SPRITE_DATA, any>
---@param tile_cell table
tryMove = function(sprite, sprite_data, tile_cell)
    local callback = Callable(
        function()
            tweenCallback(sprite, sprite_data)
        end)
    Move_Tweener:tryTween(sprite, sprite_data, tile_cell, Main_Data.CREATURE_MOVE_DURATION, callback)
end

---@param sprite AnimatedSprite2D
---@param sprite_table table<AnimatedSprite2D, any>
---@param sprite_data table<SPRITE_DATA, any>
---@param position table<integer, integer>
checkCreature = function(sprite, sprite_table, sprite_data, position)
    -- print(string.format("%s, %s, [%d, %d]", "checkCreature", tostring(sprite), position[1], position[2]))
    local moved_flag = sprite_data[Enum_Data.SPRITE_DATA.MOVED_FLAG]
    if moved_flag then
        return
    else
    end
    local current_cell = sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL]
    if not current_cell then
        return
    end
    local sprite_table_data = sprite_table[sprite]
    local last_direction = sprite_table_data[Enum_Data.CREATURE_SPRITE_TYPE.LAST_DIRECTION]
    local check_direction = Data[Enum_Data.CREATURE_MOVER_TYPE.CHECK_DIRECTION][last_direction]
    for _, v in ipairs(check_direction) do
        local v_direction = Direction[v]
        local v_direction_position = {position[1] + v_direction[1], position[2] + v_direction[2]}
        local collision_flag, _, _, tile_cell = Collision:check(v_direction_position, Enum_Data.COLLISION_TYPE.CREATURE)
        if not collision_flag and tile_cell then
            tryMove(sprite, sprite_data, tile_cell)
            sprite_table_data[Enum_Data.CREATURE_SPRITE_TYPE.LAST_DIRECTION] = v
            -- print(string.format("%s, %s, %s, %d", "move", tostring(collision_flag), tostring(block), v))
            break
        else
        end
    end
    -- for _, v in ipairs(check_direction) do
    --     local v_direction = Direction[v[1]]
    --     local v_wall = Direction[v[2]]
    --     local v_wall_position = {position[1] + v_wall[1], position[2] + v_wall[2]}
    --     local v_wall_collision_flag, _, _, _ = Collision:check(v_wall_position, Enum_Data.COLLISION_TYPE.CREATURE)
    --     if v_wall_collision_flag then
    --         local v_direction_position = {position[1] + v_direction[1], position[2] + v_direction[2]}
    --         local collision_flag, _, _, tile_cell = Collision:check(v_direction_position, Enum_Data.COLLISION_TYPE.CREATURE)
    --         if not collision_flag and tile_cell then
    --             tryMove(sprite, sprite_data, tile_cell)
    --             break
    --         else
    --         end
    --     else
    --     end
    -- end
end

---@param module_resource table<CAVE_TYPE, any>
checkData = function(module_resource)
    -- local sprite_data = Sprite_Manager_Data[Enum_Data.SPRITE_MANAGER_TYPE.SPRITE_DATA]
    -- local can_move_creature = Data[Enum_Data.CREATURE_MOVER_TYPE.CAN_MOVE_CREATURE]
    -- for _, v in ipairs(can_move_creature) do
    --     local creature_sprite_data = sprite_data[v]
    --     if creature_sprite_data then
    --         local creature_table = creature_sprite_data[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    --         checkCreatureData(creature_table)
    --     else
    --     end
    -- end
    local cave_object_data = module_resource[Enum_Data.MODULE_RESOURCE.OBJECT_DATA]
    local can_move_creature = Data[Enum_Data.CREATURE_MOVER_TYPE.CAN_MOVE_CREATURE]
    local cave_data_y = #cave_object_data
    local cave_data_x = #cave_object_data[1]
    for y = cave_data_y - 1, 1, -1 do
        local row = cave_object_data[y]
        for x = 2, cave_data_x - 1 do
            local tile_cell = row[x]
            local current_position = tile_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
            local tile_cell_object = tile_cell[Enum_Data.TILE_CELL_TYPE.LIST]
            for sprite2d, sprite_data in pairs(tile_cell_object) do
                local block, sprite_table = Calculator:queryBlockType(sprite2d)
                if block then
                    if Calculator:hasInBlock(block, can_move_creature) then
                        if sprite_table then
                            checkCreature(sprite2d, sprite_table, sprite_data, current_position)
                        else
                        end
                    else
                    end
                else
                end
            end
        end
    end
end

---@param delta float
function Creature_mover:heart(delta)
    if Game_Data[Enum_Data.CAVE_TYPE.CURRENT_STATE] == Enum_Data.GAME_STATE.GAMING then
        local module_resource = Game_Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
        if module_resource == nil or not Game_Data[Enum_Data.CAVE_TYPE.LOAD_FLAG] then
            return
        end
        checkData(module_resource)
    end
end

return Creature_mover

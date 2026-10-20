--res://lua/feature/action/game/bomber.lua
local Enum_Data = require("lua.enum.enum_data")
local Main_Data = require("lua.feature.data.main")
local Data = require("lua.feature.data.game.bomber")
local Game_Data = require("lua.feature.data.game.game")
local Calculator = require("lua.feature.action.calculator")
local Sprite_Manager = require("lua.feature.action.object.sprite.manager")
local Bomb = require("lua.feature.action.object.sprite.bomb")
local Sound_Player = require("lua.feature.action.sound.sound_player")
local checkData = nil
local cellScripsSize = nil
local hasQueryBomb = nil
local performBomb = nil
local tweenCallback = nil
local bombSquareBlockOfCell = nil
local bombSquareBlock = nil
local removeSprite = nil
local hasUnbombBlock = nil
local queryBombBlock = nil

---@param tile_cell table
---@param trigger_block BLOCK
---@return bool
queryBombBlock = function(tile_cell, trigger_block)
    local spawn_block = nil
    if Enum_Data.BLOCK.BAT == trigger_block then
        spawn_block = Enum_Data.BLOCK.DIAMOND
    else
    end
    local flag = Sprite_Manager:enqueueSprite(Enum_Data.BLOCK.BOMB, tile_cell, spawn_block)
    return flag
end

---@param block BLOCK
hasUnbombBlock = function(block)
    local unbomb_block = Data[Enum_Data.BOMBER_TYPE.UNBOMB_BLOCK]
    for _, v in ipairs(unbomb_block) do
        if v == block then
            return true
        else
        end
    end
    return false
end

---@param module_resource table<CAVE_TYPE, any>
---@param block BLOCK
---@param sprite Sprite2D | AnimatedSprite2D
removeSprite = function(module_resource, block, sprite)
    local cave_object_data = module_resource[Enum_Data.MODULE_RESOURCE.OBJECT_DATA]
    local cave_data_y = #cave_object_data
    local cave_data_x = #cave_object_data[1]
    for y = cave_data_y - 1, 1, -1 do
        local row = cave_object_data[y]
        for x = 2, cave_data_x - 1 do
            local tile_cell = row[x]
            -- local current_position = tile_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
            local tile_cell_sprites = tile_cell[Enum_Data.TILE_CELL_TYPE.LIST]
            for k, _ in pairs(tile_cell_sprites) do
                if k == sprite then
                    local bomb_block, _ = Calculator:queryBlockType(k)
                    if Enum_Data.BLOCK.BOMB == bomb_block then
                    elseif Enum_Data.BLOCK.ROCKFORD == bomb_block then
                        tile_cell_sprites[k] = nil
                        Data[Enum_Data.BOMBER_TYPE.GAME_OVER_ACTION]()
                    else
                        tile_cell_sprites[k] = nil
                        Sprite_Manager:removeSprite(block, sprite)
                    end
                else
                end
            end
        end
    end
end

---@param module_resource table<CAVE_TYPE, any>
---@param center_x integer
---@param center_y integer
---@param tile_cell table
---@param trigger_block BLOCK
---@param temp_sprites table<Sprite2D | AnimatedSprite2D>
---@return integer
bombSquareBlockOfCell = function(module_resource, center_x , center_y, tile_cell, trigger_block, temp_sprites)
    local bomb_count = 0
    if tile_cell then
        local tile_cell_sprites = tile_cell[Enum_Data.TILE_CELL_TYPE.LIST]
        local bomb_flag = true
        for k, _ in pairs(tile_cell_sprites) do
            local block, _ = Calculator:queryBlockType(k)
            if block and not hasUnbombBlock(block) then
                removeSprite(module_resource, block, k)
                if bombSquareBlock then
                    if Enum_Data.BLOCK.ROCKFORD == block or Enum_Data.BLOCK.SKELETON == block or Enum_Data.BLOCK.BAT == block then
                        if not temp_sprites[k] then
                            temp_sprites[k] = true
                            bomb_count = bomb_count + bombSquareBlock(module_resource, center_x, center_y, block, temp_sprites)
                        else
                        end
                    else
                    end
                else
                end
            else
                bomb_flag = false
            end
        end
        if bomb_flag then
            if queryBombBlock(tile_cell, trigger_block) then
                bomb_count = bomb_count + 1
            else
            end
        else
        end
    else
    end
    return bomb_count
end

---@param module_resource table<CAVE_TYPE, any>
---@param center_x integer
---@param center_y integer
---@param trigger_block BLOCK
---@param temp_sprites table<Sprite2D | AnimatedSprite2D>
---@return integer
bombSquareBlock = function(module_resource, center_x , center_y, trigger_block, temp_sprites)
    local cave_object_data = module_resource[Enum_Data.MODULE_RESOURCE.OBJECT_DATA]
    local added_length = Data[Enum_Data.BOMBER_TYPE.BOMB_SQUARE_ADDED_LENGTH]
    local from_x = center_x - added_length
    local to_x = center_x + added_length
    local from_y = center_y - added_length
    local to_y = center_y + added_length
    -- print(string.format("%s, [%d, %d]", "index_sprite", center_x, center_y))
    local bomb_count = 0
    -- print("bombSquareBlock"..tostring(trigger_block))
    for y = from_y, to_y, 1 do
        local row = cave_object_data[y]
        if row then
            for x = from_x, to_x, 1 do
                local tile_cell = row[x]
                bomb_count = bomb_count + bombSquareBlockOfCell(module_resource, x , y, tile_cell, trigger_block, temp_sprites)
            end
        else
        end
    end
    return bomb_count
end

---@param sprite AnimatedSprite2D
---@param tile_cell_scripts table
tweenCallback = function(sprite, tile_cell_scripts)
    tile_cell_scripts[sprite] = nil
    Bomb:freeObjectOfKey(sprite)
    -- print("Bomb:freeObjectOfKey(sprite)")
end

---@param sprite AnimatedSprite2D
---@param position table<integer, integer>
---@param tile_cell_scripts table
performBomb = function(sprite, position, tile_cell_scripts)
    local sprite_table = tile_cell_scripts[sprite]
    local moved_flag = sprite_table[Enum_Data.SPRITE_DATA.MOVED_FLAG]
    if not moved_flag then
        local callback = Callable(
            function()
                tweenCallback(sprite, tile_cell_scripts)
            end)
        local tween = sprite:create_tween()
        tween:bind_node(sprite)
        tween:set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
        tween:tween_interval(Main_Data.BOMB_SHOW_DURATION)
        tween:tween_callback(callback)
        sprite_table[Enum_Data.SPRITE_DATA.MOVED_FLAG] = true
        Sound_Player:playHasTileWithPosition(Enum_Data.BLOCK.BOMB, position)
    else
    end
end

---@param tile_cell table
---@return BLOCK | nil
---@return table | nil
---@return BLOCK | nil
---@return table | nil
hasQueryBomb = function(tile_cell)
    local tile_cell_list = tile_cell[Enum_Data.TILE_CELL_TYPE.LIST]
    for k, _ in pairs(tile_cell_list) do
        local bomb_block, _ = Calculator:queryBlockType(k)
        if Enum_Data.BLOCK.BOMB == bomb_block then
            return nil, nil, nil, nil
        else
        end
    end
    local bomb_sprite_block = nil
    local bomb_sprite = nil
    local can_bomb_sprite = Data[Enum_Data.BOMBER_TYPE.CAN_BOMB_SPRITE]
    for k, _ in pairs(tile_cell_list) do
        bomb_sprite_block, _ = Calculator:queryBlockType(k)
        if bomb_sprite_block then
            if Calculator:hasInTable(can_bomb_sprite, bomb_sprite_block) > 0 then
                bomb_sprite = k
                break
            else
            end
        else
        end
    end
    -- for k, _ in pairs(tile_cell_list) do
    --     if bomb_sprite then
    --         break
    --     else
    --     end
    --     bomb_sprite_block, _ = Calculator:queryBlockType(k)
    --     for _, bomb_sprite_k in ipairs(can_bomb_sprite) do
    --         if bomb_sprite_k == bomb_sprite_block then
    --             bomb_sprite = k
    --             break
    --         else
    --         end
    --     end
    -- end
    if not bomb_sprite then
        return nil, nil, nil, nil
    else
    end
    local boulder_block = nil
    local boulder = nil
    local bombed_sprite = nil
    if bomb_sprite_block == Enum_Data.BLOCK.ROCKFORD then
        bombed_sprite = Data[Enum_Data.BOMBER_TYPE.ROCKFORD_BOMBED_SPRITE]
    else
        bombed_sprite = Data[Enum_Data.BOMBER_TYPE.BOULDER_BOMBED_SPRITE]
    end
    for k, _ in pairs(tile_cell_list) do
        boulder_block, _ = Calculator:queryBlockType(k)
        if boulder_block then
            if Calculator:hasInTable(bombed_sprite, boulder_block) > 0 then
                boulder = k
                break
            else
            end
        else
        end
    end
    -- for k, _ in pairs(tile_cell_list) do
    --     boulder_block, _ = Calculator:queryBlockType(k)
    --     if Enum_Data.BLOCK.BOULDER == boulder_block or Enum_Data.BLOCK.DIAMOND == boulder_block or Enum_Data.BLOCK.ROCKFORD == boulder_block then
    --         boulder = k
    --         break
    --     else
    --     end
    -- end
    if not boulder then
        return nil, nil, nil, nil
    else
    end
    if bomb_sprite and boulder then
        local boulder_data = tile_cell_list[boulder]
        if not boulder_data[Enum_Data.SPRITE_DATA.MOVED_FLAG] then
            if boulder ~= bomb_sprite then
                return boulder_block, boulder, bomb_sprite_block, bomb_sprite
            else
                -- print(string.format("%s, [%d, %d]", "bbb", boulder_block, bomb_sprite_block))
            end
        else
        end
    else
    end
    return nil, nil, nil, nil
end

---@param tile_cell_scripts table
---@return integer
cellScripsSize = function(tile_cell_scripts)
    local table_size = 0
    for _, _ in pairs(tile_cell_scripts) do
        table_size = table_size + 1
    end
    return table_size
end

---@param module_resource table<CAVE_TYPE, any>
checkData = function(module_resource)
    local cave_object_data = module_resource[Enum_Data.MODULE_RESOURCE.OBJECT_DATA]
    local cave_data_y = #cave_object_data
    local cave_data_x = #cave_object_data[1]
    local bomb_count = 0
    local temp_sprites = {}
    for y = cave_data_y - 1, 1, -1 do
        local row = cave_object_data[y]
        for x = 2, cave_data_x - 1 do
            local tile_cell = row[x]
            -- local current_position = tile_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
            local tile_cell_sprites = tile_cell[Enum_Data.TILE_CELL_TYPE.LIST]
            if cellScripsSize(tile_cell_sprites) > 1 then
                local boulder_block, boulder, bomb_sprite_block, bomb_sprite = hasQueryBomb(tile_cell)
                -- local bomb_block, boulder_data = queryBomb(tile_cell)
                if boulder_block and boulder and bomb_sprite_block and bomb_sprite then
                    if Enum_Data.BLOCK.ROCKFORD == bomb_sprite_block or Enum_Data.BLOCK.SKELETON == bomb_sprite_block or Enum_Data.BLOCK.BAT == bomb_sprite_block then
                        if not temp_sprites[bomb_sprite] then
                            -- print(string.format("%s, [%d, %d]", "bomb", boulder_block, bomb_sprite_block))
                            temp_sprites[bomb_sprite] = true
                            bomb_count = bombSquareBlock(module_resource, x, y, bomb_sprite_block, temp_sprites)
                        else
                        end
                    else
                    end
                else
                end
            else
            end
        end
    end
    temp_sprites = nil
    if bomb_count > 0 then
        -- print(string.format("%s, %d", "bomb_count", bomb_count))
    else
    end
    -- Sprite_Manager:flushSprite()
    for y = cave_data_y - 1, 1, -1 do
        local row = cave_object_data[y]
        for x = 2, cave_data_x - 1 do
            local tile_cell = row[x]
            local current_position = tile_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
            local tile_cell_scripts = tile_cell[Enum_Data.TILE_CELL_TYPE.LIST]
            for k, _ in pairs(tile_cell_scripts) do
                local block, _ = Calculator:queryBlockType(k)
                if Enum_Data.BLOCK.BOMB == block then
                    -- print(tostring(k))
                    performBomb(k, current_position, tile_cell_scripts)
                else
                end
            end
        end
    end
end

---@class Action.Bomber
local Bomber = {
}

function Bomber:init()
end

---@param delta float
function Bomber:heart(delta)
    if Game_Data[Enum_Data.CAVE_TYPE.PAUSE_FLAG] then
        return
    end
    if Game_Data[Enum_Data.CAVE_TYPE.CURRENT_STATE] == Enum_Data.GAME_STATE.GAMING then
        local module_resource = Game_Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
        if module_resource == nil or not Game_Data[Enum_Data.CAVE_TYPE.LOAD_FLAG] then
            return
        end
        checkData(module_resource)
    end
end

return Bomber

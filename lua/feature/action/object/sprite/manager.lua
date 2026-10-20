--res://lua/feature/action/object/sprite/manager.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.feature.data.object.sprite.manager")
local Texture_Resource = require("lua.feature.data.draw.texture_resource")
local Calculator = require("lua.feature.action.calculator")
local World_Data = require("lua.world_layout.world_data")
local Rockford = require("lua.feature.action.object.sprite.rockford")
local Exit_Door = require("lua.feature.action.object.sprite.exit_door")
local Dirt = require("lua.feature.action.object.sprite.dirt")
local Ice_Dirt = require("lua.feature.action.object.sprite.ice_dirt")
local Steel_Wall = require("lua.feature.action.object.sprite.steel_wall")
local Brick_Wall = require("lua.feature.action.object.sprite.brick_wall")
local Ice_Brick_Wall = require("lua.feature.action.object.sprite.ice_brick_wall")
local Boulder = require("lua.feature.action.object.sprite.boulder")
local Diamond = require("lua.feature.action.object.sprite.diamond")
local Bomb = require("lua.feature.action.object.sprite.bomb")
local Skeleton = require("lua.feature.action.object.sprite.skeleton")
local Bat = require("lua.feature.action.object.sprite.bat")

---@class Action.Manager
local Manager = {
}

function Manager:init()
    local sprite_moudle = Data[Enum_Data.SPRITE_MANAGER_TYPE.SPRITE_MOUDLE]
    sprite_moudle[Enum_Data.BLOCK.ROCKFORD] = Rockford
    sprite_moudle[Enum_Data.BLOCK.EXIT_DOOR] = Exit_Door
    sprite_moudle[Enum_Data.BLOCK.DIRT] = Dirt
    sprite_moudle[Enum_Data.BLOCK.ICE_DIRT] = Ice_Dirt
    sprite_moudle[Enum_Data.BLOCK.STEEL_WALL] = Steel_Wall
    sprite_moudle[Enum_Data.BLOCK.BRICK_WALL] = Brick_Wall
    sprite_moudle[Enum_Data.BLOCK.ICE_BRICK_WALL] = Ice_Brick_Wall
    sprite_moudle[Enum_Data.BLOCK.BOULDER] = Boulder
    sprite_moudle[Enum_Data.BLOCK.DIAMOND] = Diamond
    sprite_moudle[Enum_Data.BLOCK.BOMB] = Bomb
    sprite_moudle[Enum_Data.BLOCK.SKELETON] = Skeleton
    sprite_moudle[Enum_Data.BLOCK.BAT] = Bat
    Rockford:init()
end

---@param row table
---@param position_x integer
---@param position_y integer
---@return table
function Manager:queryTileCcell(row, position_x, position_y)
    local tile_cell = {
        [Enum_Data.TILE_CELL_TYPE.LIST] = row,
        [Enum_Data.TILE_CELL_TYPE.POSITION] = {position_x, position_y},
    }
    return tile_cell
end

---@param tile_cell table
---@return table
function Manager:querySpriteData(tile_cell)
    local sprite_data = {
            [Enum_Data.SPRITE_DATA.CURRENT_CELL] = tile_cell,
            [Enum_Data.SPRITE_DATA.MOVED_FLAG] = false,
            [Enum_Data.SPRITE_DATA.TARGET_CELL] = nil,
        }
    return sprite_data
end

---@param block BLOCK
---@param tile_cell table
---@return bool
function Manager:hasSameEnqueueSprite(block, tile_cell)
    local enqueue_list = Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_LIST]
    for _, v in ipairs(enqueue_list) do
        local enqueue_list_block = v[Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_BLOCK]]
        local enqueue_list_tile_cell = v[Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_TILE_CELL]]
        if enqueue_list_tile_cell == tile_cell and enqueue_list_block == block then
            return true
        else
        end
    end
    return false
end

---@param block BLOCK
---@param tile_cell table
---@param spawn_block BLOCK | nil
---@return bool
function Manager:enqueueSprite(block, tile_cell, spawn_block)
    local enqueue_list = Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_LIST]
    for _, v in ipairs(enqueue_list) do
        local enqueue_list_block = v[Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_BLOCK]]
        local enqueue_list_tile_cell = v[Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_TILE_CELL]]
        local enqueue_list_spawn_block = v[Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_SPAWN_BLOCK]]
        if enqueue_list_tile_cell == tile_cell and enqueue_list_block == block then
            if Enum_Data.BLOCK.BOMB == enqueue_list_block then
                if enqueue_list_spawn_block == nil and spawn_block then
                    v[Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_SPAWN_BLOCK]] = spawn_block
                    -- bat > skeleton
                else
                end
            else
            end
            return false
        else
        end
    end
    local sprite_table = {}
    sprite_table[Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_BLOCK]] = block
    sprite_table[Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_TILE_CELL]] = tile_cell
    sprite_table[Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_SPAWN_BLOCK]] = spawn_block
    table.insert(enqueue_list, sprite_table)
    return true
end

function Manager:flushSprite()
    local enqueue_list = Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_LIST]
    while #enqueue_list > 0 do
        local enqueue_data = table.remove(enqueue_list)
        local block = enqueue_data[Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_BLOCK]]
        local tile_cell = enqueue_data[Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_TILE_CELL]]
        local spawn_block = enqueue_data[Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_SPAWN_BLOCK]]
        if block and tile_cell then
            local sprite = self:query(block, tile_cell)
            if sprite then
                local sprite_data = self:querySpriteData(tile_cell)
                local tile_cell_sprites = tile_cell[Enum_Data.TILE_CELL_TYPE.LIST]
                tile_cell_sprites[sprite] = sprite_data
            else
            end
        else
        end
        if block and tile_cell and spawn_block then
            if Enum_Data.BLOCK.BOMB == block then
                local sprite = self:query(spawn_block, tile_cell)
                if sprite then
                    local sprite_data = self:querySpriteData(tile_cell)
                    local tile_cell_sprites = tile_cell[Enum_Data.TILE_CELL_TYPE.LIST]
                    tile_cell_sprites[sprite] = sprite_data
                    -- sprite:hide()
                else
                end
            else
            end
        end
    end
    -- for _, v in ipairs(enqueue_list) do
    --     local block = v[Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_BLOCK]]
    --     local tile_cell = v[Data[Enum_Data.SPRITE_MANAGER_TYPE.ENQUEUE_TILE_CELL]]
    --     if block and tile_cell then
    --         self:query(block, tile_cell)
    --     else
    --     end
    -- end
end

---@param block BLOCK
---@param tile_cell table
---@return Sprite2D | AnimatedSprite2D | nil
function Manager:query(block, tile_cell)
    local texture_resource = Texture_Resource.tileset_texture
    local sprite2d_class = Data[Enum_Data.SPRITE_MANAGER_TYPE.SPRITE_MOUDLE][block]
    local sprite2d = nil
    if sprite2d_class == nil then
        return sprite2d
    end
    ---@diagnostic disable:undefined-field
    sprite2d = sprite2d_class:query()
    local sprite_class_type = Data[Enum_Data.SPRITE_MANAGER_TYPE.SPRITE_CLASS_TYPE][block]
    if sprite_class_type == Enum_Data.SPRITE_CLASS_TYPE.SPRITE_2D then
        local frame_offset = Data[Enum_Data.SPRITE_MANAGER_TYPE.FRAME_OFFSET]
        sprite2d:set_texture(texture_resource)
        sprite2d:set_hframes(frame_offset[1])
        sprite2d:set_vframes(frame_offset[2])
        sprite2d:set_frame(Data[Enum_Data.SPRITE_MANAGER_TYPE.BLOCK_TO_SPRITE_FRAME_INDEX][block])
    elseif sprite_class_type == Enum_Data.SPRITE_CLASS_TYPE.ANIMATED_SPRITE_2D then
    end
    local position = tile_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
    local v = Calculator:calcVector2(position[1], position[2])
    sprite2d:set_position(v)
    ---@type Node2D
    local node2d = World_Data.node2D
    if not sprite2d:get_parent() then -- ?
        -- print("m 001")
        node2d:add_child(sprite2d)
        -- print("m 002")
    end
    -- if block == 9 then
    --     print("rock "..tostring(sprite2d_class))
    -- end
    return sprite2d
end

---@param block BLOCK
---@param sprite Sprite2D | AnimatedSprite2D
function Manager:removeSprite(block, sprite)
    local sprite_class_table = Data[Enum_Data.SPRITE_MANAGER_TYPE.SPRITE_MOUDLE]
    local sprite_class = sprite_class_table[block]
    if sprite_class then
        if sprite_class.freeObjectOfKey then
            sprite_class:freeObjectOfKey(sprite)
        else
            -- print("??"..block..","..tostring(sprite))
        end
    else
    end
    -- local block, sprite_table = self:queryBlockType(sprite2d)
    -- if not block or not sprite_table then
    --     return
    -- end
    -- local sprite_data = sprite_table[sprite2d]
    -- local tile_cell = sprite_data[Enum_Data.SPRITE_DATA.TILE_CELL]
    -- local cell_list = tile_cell[Enum_Data.TILE_CELL_TYPE.LIST]
    -- local position = tile_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
    -- local flag = false
    -- for k, _ in pairs(cell_list) do
    --     if k == sprite2d then
    --         cell_list[k] = nil
    --         sprite_table[sprite2d] = nil
    --         flag = true
    --         break
    --     end
    -- end
    -- print(string.format("%s, %s, %d, %d", "QaQ", flag, position[1], position[2]))
    -- sprite2d:queue_free()
end

function Manager:freeObject()
    -- Rockford:freeObject()
    self:freeSpriteTable()
end

function Manager:pauseObject()
    Rockford:pauseObject()
    Exit_Door:pauseObject()
    Boulder:pauseObject()
    Diamond:pauseObject()
    Skeleton:pauseObject()
    Bat:pauseObject()
    Bomb:pauseObject()
end

function Manager:freeSpriteTable()
    local sprite_moudle = Data[Enum_Data.SPRITE_MANAGER_TYPE.SPRITE_MOUDLE]
    for _, v in pairs(sprite_moudle) do
        v:freeObject()
    end
end

return Manager

--res://lua/feature/action/object/sprite/rockford.lua
local Enum_Data = require("lua.enum.enum_data")
local Main_Data = require("lua.feature.data.main")
local Direction = require("lua.feature.data.direction")
-- local Rockford_Move_Data = require("lua.feature.data.command.rockford_move")
local Data = require("lua.feature.data.object.sprite.rockford")
local Game_Data = require("lua.feature.data.game.game")
local Dirt = require("lua.feature.action.object.sprite.dirt")
local Ice_Dirt = require("lua.feature.action.object.sprite.ice_dirt")
local Diamond = require("lua.feature.action.object.sprite.diamond")
local Exit_Door = require("lua.feature.action.object.sprite.exit_door")
--local World_Data = require("lua.world_layout.world_data")
local Collision = require("lua.feature.action.game.collision")
-- local Sprite_Manager = require("lua.feature.action.object.sprite.manager")
-- local Tile_Check = require("lua.feature.action.tile_check")
local Pusher = require("lua.feature.action.game.pusher")
local Move_Tweener = require("lua.feature.action.game.move_tweener")
local Camera_2D_Action = require("lua.feature.action.object.camera_2d.camera_2d")
local Sound_Player = require("lua.feature.action.sound.sound_player")
local Attribute_Board_Action = require("lua.user_interface_layout.attribute_board.attribute_board_action")
local Cave_Difficulty = require("lua.feature.action.object.cave.cave_difficulty")
local tryMove = nil
-- local commandMovedBuffer = nil
local tryTween = nil
local tweenCallback = nil
local tryDigDirt = nil
local tryTouchDiamond = nil
local tryOpenDoor = nil
local checkCurrentTileCell = nil

---@class Action.Rockford
local Rockford = {
}

function Rockford:init()
--    Data.callback = Callable(function() self:movedDone() end)
    Camera_2D_Action:init()
--    Heart:add(self) -- ?
end

---@return AnimatedSprite2D
function Rockford:query()
    local load_tscn_file = Data[Enum_Data.SPRITE_TYPE.LOAD_TSCN_FILE]
    if not load_tscn_file then
        load_tscn_file = ResourceLoader:load(Data[Enum_Data.SPRITE_TYPE.TSCN_FILE])
        Data[Enum_Data.SPRITE_TYPE.LOAD_TSCN_FILE] = load_tscn_file
    else
    end
    local sprite2d = load_tscn_file:instantiate()
    Data[Enum_Data.SPRITE_TYPE.SELF_SPRITE] = sprite2d
    sprite2d.z_index = 1
    Data[Enum_Data.SPRITE_TYPE.ROCKFORD_MOVED_TABLE] = {
        [Enum_Data.ROCKFORD_MOVED_TYPE.LAST_MOVED] = nil,
        [Enum_Data.ROCKFORD_MOVED_TYPE.MOVED_FLAG] = false,
    }
    sprite2d:play(Data[Enum_Data.SPRITE_TYPE.ACTION_TABLE][Enum_Data.ROCKFORD_ACTION.MOVE_DOWN])
    return sprite2d
end

---@param delta float
function Rockford:heart(delta)
    if Game_Data[Enum_Data.CAVE_TYPE.PAUSE_FLAG] then
        return
    end
    if Game_Data[Enum_Data.CAVE_TYPE.CURRENT_STATE] == Enum_Data.GAME_STATE.GAMING then
    end
end

---@param direction MOVE
checkCurrentTileCell = function(direction)
    local sprite_data = Data[Enum_Data.SPRITE_TYPE.SELF_DATA]
    ---@cast sprite_data table
    if not sprite_data then
        return
    end
    local current_cell = sprite_data[Enum_Data.SPRITE_DATA.TARGET_CELL]
    if not current_cell then
        return
    end
    local tile_cell_position = current_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
    local module_resource = Game_Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
    local ground_data = module_resource[Enum_Data.MODULE_RESOURCE.GROUND_DATA]
    local block = ground_data[tile_cell_position[2]][tile_cell_position[1]]
    local moved_table = Data[Enum_Data.SPRITE_TYPE.ROCKFORD_MOVED_TABLE]
    ---@cast moved_table table
    if Enum_Data.BLOCK.ICE_EMPTY == block then
        -- print(string.format("%s, [%d, %d], %d", "???", tile_cell_position[1], tile_cell_position[2], ground_data[tile_cell_position[2]][tile_cell_position[1]]))
        moved_table[Enum_Data.ROCKFORD_MOVED_TYPE.LAST_MOVED] = direction
        moved_table[Enum_Data.ROCKFORD_MOVED_TYPE.MOVED_FLAG] = true
    else
        moved_table[Enum_Data.ROCKFORD_MOVED_TYPE.LAST_MOVED] = nil
        moved_table[Enum_Data.ROCKFORD_MOVED_TYPE.MOVED_FLAG] = false
    end
end

---@return bool
tryOpenDoor = function()
    ---@type table<MODULE_RESOURCE, any>
    local mod = Game_Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
    local diamonds_required = mod[Enum_Data.MODULE_RESOURCE.DIAMONDS_REQUIRED]
    if diamonds_required <= 0 then
        Cave_Difficulty:nextLevel()
        return true
    end
    return false
end

---@param sprite AnimatedSprite2D
---@param sprite_data table
---@param open_door_flag bool
tweenCallback = function(sprite, sprite_data, open_door_flag)
    --if current_state == Enum_Data.GAME_STATE.GAMING then
    --current_state = Data[Enum_Data.CAVE_TYPE.CURRENT_STATE]
    sprite_data[Enum_Data.SPRITE_DATA.MOVED_FLAG] = false
    local current_cell = sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL]
    local current_cell_list = current_cell[Enum_Data.TILE_CELL_TYPE.LIST]
    current_cell_list[sprite] = nil
    sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL] = sprite_data[Enum_Data.SPRITE_DATA.TARGET_CELL]
    sprite_data[Enum_Data.SPRITE_DATA.TARGET_CELL] = nil
    if open_door_flag then
        if tryOpenDoor() then
            return
        else
        end
    else
    end
    local moved_table = Data[Enum_Data.SPRITE_TYPE.ROCKFORD_MOVED_TABLE]
    if moved_table[Enum_Data.ROCKFORD_MOVED_TYPE.MOVED_FLAG] then
        local direction = moved_table[Enum_Data.ROCKFORD_MOVED_TYPE.LAST_MOVED]
        if tryMove then
            tryMove(direction)
        else
        end
    else
    end
end

---@param sprite AnimatedSprite2D
---@param sprite_data table
---@param tile_cell table
---@param duration float
---@param open_door_flag bool
tryTween = function(sprite, sprite_data, tile_cell, duration, open_door_flag)
    local callback = Callable(
        function()
            tweenCallback(sprite, sprite_data, open_door_flag)
        end)
    Move_Tweener:tryTween(sprite, sprite_data, tile_cell, duration, callback)
end

---@param current_row table
---@param block BLOCK
---@param sprite Sprite2D
tryDigDirt = function(current_row, block, sprite)
--    print(string.format("%s, %s, %s", tostring(current_row), tostring(sprite), tostring(current_row[sprite])))
    if Enum_Data.BLOCK.DIRT == block then
        Dirt:freeObjectOfKey(sprite)
    elseif Enum_Data.BLOCK.ICE_DIRT == block then
        Ice_Dirt:freeObjectOfKey(sprite)
    else
    end
    current_row[sprite] = nil
end

---@param current_row table
---@param sprite Sprite2D
tryTouchDiamond = function(current_row, sprite)
    local sprite_data = current_row[sprite]
    Diamond:freeObjectOfKey(sprite)
    local target_cell = sprite_data[Enum_Data.SPRITE_DATA.TARGET_CELL]
    if target_cell then
        local tarrget_row = sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL][Enum_Data.TILE_CELL_TYPE.LIST]
        tarrget_row[sprite] = nil
        -- print("free tarrget_row object")
    end
    current_row[sprite] = nil
    ---@type table<MODULE_RESOURCE, any>
    local mod = Game_Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
    local diamonds_required = mod[Enum_Data.MODULE_RESOURCE.DIAMONDS_REQUIRED]
    diamonds_required = diamonds_required - 1
    mod[Enum_Data.MODULE_RESOURCE.DIAMONDS_REQUIRED] = diamonds_required
    Attribute_Board_Action:updateDiamonds(math.max(diamonds_required, 0))
    if diamonds_required == 0 then
        Exit_Door:openDoor()
    end
end

---@param direction MOVE
tryMove = function(direction)
    if Game_Data[Enum_Data.CAVE_TYPE.PAUSE_FLAG] then
        return
    end
    if Game_Data[Enum_Data.CAVE_TYPE.CURRENT_STATE] ~= Enum_Data.GAME_STATE.GAMING then
        return
    end
    local sprite_data = Data[Enum_Data.SPRITE_TYPE.SELF_DATA]
    ---@cast sprite_data table
    local moved_flag = sprite_data[Enum_Data.SPRITE_DATA.MOVED_FLAG]
    if moved_flag then
--        commandMovedBuffer(direction)
        return
    end
    local sprite2d = Data[Enum_Data.SPRITE_TYPE.SELF_SPRITE]
    sprite2d:play(Data[Enum_Data.SPRITE_TYPE.ACTION_TABLE][direction])
    local current_cell = sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL]
    if not current_cell then
        return
    end
    local offset = Direction[direction]
    local current_position = current_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
    local target_position = {current_position[1] + offset[1], current_position[2] + offset[2]}
    local collision_flag, block, sprite, tile_cell = Collision:check(target_position, Enum_Data.COLLISION_TYPE.ROCKFORD)
    local pusher_flag = false
    local open_door_flag = false
    if collision_flag then
        local moved_table = Data[Enum_Data.SPRITE_TYPE.ROCKFORD_MOVED_TABLE]
        ---@cast moved_table table
        moved_table[Enum_Data.ROCKFORD_MOVED_TYPE.MOVED_FLAG] = false
        moved_table[Enum_Data.ROCKFORD_MOVED_TYPE.LAST_MOVED] = nil
        if block and sprite and tile_cell then
            pusher_flag = Pusher:tryPush(block, target_position, direction, sprite, tile_cell)
            if pusher_flag then
                Camera_2D_Action:update(offset[1], offset[2])
                tryTween(sprite2d, sprite_data, tile_cell, Main_Data.ROCKFORD_PUSH_DURATION, false)
                -- local test = checkCurrentTileCell()
                -- print(string.format("%s, %s", "???", tostring(test)))
            else
            end
        else
        end
        return
    else
        if block ~= nil then
            Sound_Player:playHasTile(block)
            ---@cast sprite Sprite2D
            if tile_cell then
                if Enum_Data.BLOCK.DIRT == block or Enum_Data.BLOCK.ICE_DIRT == block then
                    tryDigDirt(tile_cell[Enum_Data.TILE_CELL_TYPE.LIST], block, sprite)
                elseif Enum_Data.BLOCK.DIAMOND == block then
                    tryTouchDiamond(tile_cell[Enum_Data.TILE_CELL_TYPE.LIST], sprite)
                elseif Enum_Data.BLOCK.EXIT_DOOR == block then
                    open_door_flag = true
--                    tryOpenDoor()
                end
            end
        end
    end
    if tile_cell then
        Camera_2D_Action:update(offset[1], offset[2])
        tryTween(sprite2d, sprite_data, tile_cell, Main_Data.ROCKFORD_MOVE_DURATION, open_door_flag)
        checkCurrentTileCell(direction)
        -- local test = checkCurrentTileCell(direction)
        -- print(string.format("%s, %s", "???", tostring(test)))
    else
    end
--    tryTween(sprite2d, sprite_data, target_position, Main_Data.ROCKFORD_MOVE_DURATION)
end

function Rockford:up()
    local moved_table = Data[Enum_Data.SPRITE_TYPE.ROCKFORD_MOVED_TABLE]
    if moved_table[Enum_Data.ROCKFORD_MOVED_TYPE.MOVED_FLAG] then
        -- print("ROCKFORD_MOVED_TABLE locked")
        return
    else
    end
    tryMove(Enum_Data.MOVE.UP)
end

function Rockford:down()
    local moved_table = Data[Enum_Data.SPRITE_TYPE.ROCKFORD_MOVED_TABLE]
    if moved_table[Enum_Data.ROCKFORD_MOVED_TYPE.MOVED_FLAG] then
        -- print("ROCKFORD_MOVED_TABLE locked")
        return
    else
    end
    tryMove(Enum_Data.MOVE.DOWN)
end

function Rockford:left()
    local moved_table = Data[Enum_Data.SPRITE_TYPE.ROCKFORD_MOVED_TABLE]
    if moved_table[Enum_Data.ROCKFORD_MOVED_TYPE.MOVED_FLAG] then
        -- print("ROCKFORD_MOVED_TABLE locked")
        return
    else
    end
    tryMove(Enum_Data.MOVE.LEFT)
end

function Rockford:right()
    local moved_table = Data[Enum_Data.SPRITE_TYPE.ROCKFORD_MOVED_TABLE]
    if moved_table[Enum_Data.ROCKFORD_MOVED_TYPE.MOVED_FLAG] then
        -- print("ROCKFORD_MOVED_TABLE locked")
        return
    else
    end
    tryMove(Enum_Data.MOVE.RIGHT)
end

function Rockford:enterWorld()
    Camera_2D_Action:enterWorld()
end

function Rockford:pauseObject()
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

function Rockford:freeObject()
    local sprite = Data[Enum_Data.SPRITE_TYPE.SELF_SPRITE]
    if sprite then
        sprite:queue_free()
    else
    end
    -- Data.callback = nil
    Camera_2D_Action:freeObject()
end

return Rockford

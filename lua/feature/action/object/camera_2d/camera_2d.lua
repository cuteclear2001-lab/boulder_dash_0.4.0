--res://lua/feature/action/object/camera_2d/camera_2d.lua
local Enum_Data = require("lua.enum.enum_data")
local Main_Data = require("lua.feature.data.main")
local Data = require("lua.feature.data.object.camera_2d.camera_2d")
local Rockford_Data = require("lua.feature.data.object.sprite.rockford")
local Calculator = require("lua.feature.action.calculator")
local World_Data = require("lua.world_layout.world_data")

---@class Action.Camera_2D
local Camera_2D = {
}

function Camera_2D:init()
--    print("Camera_2D:init()")
    -- Data.callback = Callable(function() self:movedDone() end)
    self:setup()
end

function Camera_2D:setup()
    local camera_2d = ResourceLoader:load(Data.CAMERA_2D_FILE):instantiate()
    if not camera_2d:get_parent() then
        ---@type Node2D
        local node2d = World_Data.node2D
        node2d:add_child(camera_2d)
    end
    Data.camera_2d = camera_2d
    -- print("Camera_2D:setup()")
--    self:enterWorld()
end

function Camera_2D:enterWorld()
    if not Data.callback then
        Data.callback = Callable(function() self:movedDone() end)
    else
    end
    if Data.current_moved_tween then
        Data.current_moved_tween:kill()
        Data.current_moved_tween = nil
    end
    Data.tween_position_list = {}
    Data.moved_flag = false
    -- Data.callback = Callable(function() self:movedDone() end)
    local sprite_data = Rockford_Data[Enum_Data.SPRITE_TYPE.SELF_DATA]
    local current_cell = sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL]
    local rockford_position = current_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
    local position = Calculator:calcVector2(rockford_position[1], rockford_position[2])
    Data.camera_2d:set_position(position)
end

function Camera_2D:movedDone()
    local tween_position_list = Data.tween_position_list
    if #tween_position_list > 0 then
        local tween_position = table.remove(tween_position_list, 1)
--        print("Camera_2D:movedDone")
        self:createTween(tween_position)
    else
        Data.moved_flag = false
    end
    -- print("Camera_2D:movedDone")
end

---@param position table<integer, integer>
---@return Tween
function Camera_2D:createTween(position)
    local target_pixel_position = Calculator:calcVector2(position[1], position[2])
    ---@type Camera2D
    local camera_2d = Data.camera_2d
    local tween = camera_2d:create_tween()
    tween:bind_node(camera_2d)
    tween:set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
    tween:tween_property(camera_2d, Main_Data.NODE_PATH_POSITION, target_pixel_position, Main_Data.CAMERA_2D_MOVE_DURATION)
    tween:tween_callback(Data.callback)
--    print("Camera_2D:createTween"..tostring(tween))
    Data.current_moved_tween = tween
    return tween
end

---@param offset_x integer
---@param offset_y integer
---@return Tween | nil
function Camera_2D:update(offset_x, offset_y)
    local sprite_data = Rockford_Data[Enum_Data.SPRITE_TYPE.SELF_DATA]
    ---@cast sprite_data table
    local current_cell = sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL]
    local rockford_position = current_cell[Enum_Data.TILE_CELL_TYPE.POSITION]-- Rockford_Data.position
    local position = {rockford_position[1] + offset_x, rockford_position[2] + offset_y}
    local tween_position_list = Data.tween_position_list
    if #tween_position_list > 0 then
        local temp_position = tween_position_list[#tween_position_list]
        if position[1] == temp_position[1] and position[2] == temp_position[2] then
        else
            table.insert(tween_position_list, position)
        end
    else
        table.insert(tween_position_list, position)
    end
    if not Data.moved_flag and #tween_position_list > 0 then
        Data.moved_flag = true
        local tween_position = table.remove(tween_position_list, 1)
        local tween = self:createTween(tween_position)
--        print("tween"..tostring(tween))
        return tween
    end
--    print("#tween_position_list = "..tostring(#tween_position_list))
    return nil
end

function Camera_2D:freeObject()
    Data.callback = nil
end

return Camera_2D

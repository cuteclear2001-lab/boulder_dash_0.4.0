--res://lua/feature/action/game/move_tweener.lua
local Enum_Data = require("lua.enum.enum_data")
local Main_Data = require("lua.feature.data.main")
local Calculator = require("lua.feature.action.calculator")

---@class Action.Move_Tweener
local Move_Tweener = {
}

function Move_Tweener:tryTween(sprite, sprite_data, target_cell, duration, callback)
    local target_position = target_cell[Enum_Data.TILE_CELL_TYPE.POSITION]
    local target_position_vector = Calculator:calcVector2(target_position[1], target_position[2])
    local tween = sprite:create_tween()
    tween:bind_node(sprite)
    tween:set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
    tween:tween_property(sprite, Main_Data.NODE_PATH_POSITION, target_position_vector, duration)
    sprite_data[Enum_Data.SPRITE_DATA.MOVED_FLAG] = true
    sprite_data[Enum_Data.SPRITE_DATA.TARGET_CELL] = target_cell
--    local target_cell_list = target_cell[Enum_Data.TILE_CELL_TYPE.LIST]
    target_cell[Enum_Data.TILE_CELL_TYPE.LIST][sprite] = sprite_data
    tween:tween_callback(callback)
end
-- target_cell_list

return Move_Tweener

--res://lua/feature/action/calculator.lua
local Enum_Data = require("lua.enum.enum_data")
local Main_Data = require("lua.feature.data.main")
local Sprite_Manager_Data = require("lua.feature.data.object.sprite.manager")

---@class Calculator
local Calculator = {
}

---@param table table<BLOCK>
---@param block BLOCK
---@return integer
function Calculator:hasInTable(table, block)
    local index = 0
    for k, v in ipairs(table) do
        if block == v then
            return k
        else
        end
    end
    return index
end

---@param block BLOCK
---@return integer
function Calculator:queryBlockCount(block)
    local sprites_table = Sprite_Manager_Data[Enum_Data.SPRITE_MANAGER_TYPE.SPRITE_DATA]
    if not sprites_table then
        return 0
    end
    local sprite_object = sprites_table[block]
    if not sprite_object then
        return 0
    end
    local sprite_table = sprite_object[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
    if not sprite_table then
        return 0
    end
    local count_number = 0
    for _, _ in pairs(sprite_table) do
        count_number = count_number + 1
    end
    return count_number
end

---@param position_x integer
---@param position_y integer
---@return Vector2
function Calculator:calcVector2(position_x, position_y)
    local size = Main_Data.BLOCK_SIZE
    local x, y = size * .5, size * .5
    x = x + (position_x - 1) * size
    y = y + (position_y - 1) * size
    local v = Vector2(x, y)
    return v
end

---@param sprite2d Sprite2D|AnimatedSprite2D
---@return BLOCK|nil
---@return table|nil
function Calculator:queryBlockType(sprite2d)
    local sprite_data = Sprite_Manager_Data[Enum_Data.SPRITE_MANAGER_TYPE.SPRITE_DATA]
--    print(string.format("%s ,%s", "Calculator:queryBlockType", tostring(sprite2d)))
    for k, v in pairs(sprite_data) do
        local sprite_table = v[Enum_Data.SPRITE_TYPE.SPRITE_TABLE]
        if sprite_table and sprite_table[sprite2d] then
            return k, sprite_table
        end
        local self_sprite = v[Enum_Data.SPRITE_TYPE.SELF_SPRITE]
        if self_sprite == sprite2d then
            return k, sprite2d
        end
    end
    return nil, nil
end

---@param block BLOCK
---@param block_table table<BLOCK>
---@return bool
function Calculator:hasInBlock(block, block_table)
    for _, v in ipairs(block_table) do
        if v == block then
            return true
        else
        end
    end
    return false
end

return Calculator

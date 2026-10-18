--res://lua/user_interface_layout/attribute_board/attribute_board_action.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.user_interface_layout.attribute_board.attribute_board_data")
local Texture_Resource = require("lua.feature.action.draw.texture_resource")

---@class Action.Attribute_Board
local Attribute_Board = {
}

---@param control Control
function Attribute_Board:init(control)
    Data.control = control
    self:setup()
end

function Attribute_Board:setup()
    ---@type Control
    local control = Data.control
    local container = Data.container
    local label = Data.label
    local label_name = Data.label_name
    for k, v in pairs(container) do
        local cell = control:find_child(v)
        local nameLabel = cell:find_child("NameLabel")
        if k == Enum_Data.ATTRIBUTE.DIAMONDS_REQUIRED
            or k == Enum_Data.ATTRIBUTE.REMAINING_TIME
                then
            local rect_index = Enum_Data.RECT.DIAMOND
            if k == Enum_Data.ATTRIBUTE.REMAINING_TIME then
                rect_index = Enum_Data.RECT.TIME
            end
            local textureRect = cell:find_child("TextureRect")
            nameLabel.visible = false
            textureRect.visible = true
            local atlas_texture = Texture_Resource:queryAtlasTexture(rect_index)
            textureRect:set_texture(atlas_texture)
        else
            nameLabel.text = label_name[k]
        end
        --TextureRect
        --Enum_Data.ATTRIBUTE.DIAMONDS_REQUIRED
        --Enum_Data.ATTRIBUTE.REMAINING_TIME
        local valueLabel = cell:find_child("ValueLabel")
        label[k] = valueLabel
    end
--    self:update(Enum_Data.ATTRIBUTE.SCORE, "?")
end

---@param attribute ATTRIBUTE
---@param value string
function Attribute_Board:update(attribute, value)
    local label = Data.label[attribute]
    label.text = value
end

---@param current_time integer
function Attribute_Board:updateTime(current_time)
    self:update(Enum_Data.ATTRIBUTE.REMAINING_TIME, string.format("%03d", current_time))
end

---@param diamond integer
function Attribute_Board:updateDiamonds(diamond)
    self:update(Enum_Data.ATTRIBUTE.DIAMONDS_REQUIRED, string.format("%03d", diamond))
end

return Attribute_Board

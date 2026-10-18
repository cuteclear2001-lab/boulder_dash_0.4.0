--res://lua/user_interface_layout/cave_difficulty_select/cave_list/cave_list_action.lua
local Cave_Difficulty_Data = require("lua.feature.data.object.cave.cave_difficulty")
local Data = require("lua.user_interface_layout.cave_difficulty_select.cave_list.cave_list_data")
local Cave_H_Slider_Data = require("lua.user_interface_layout.cave_difficulty_select.cave_h_slider.cave_h_slider_data")

---@class Action.Cave_List
local Cave_List = {
}

---@param hBoxContainer HBoxContainer
function Cave_List:init(hBoxContainer)
    Data.hBoxContainer = hBoxContainer
    self:setup()
end

function Cave_List:setup()
    ---@type HBoxContainer
    local hBoxContainer = Data.hBoxContainer
    local button_count = #Cave_Difficulty_Data.data
    for i = 1, button_count do
        local cell = Data.resourceLoader:instantiate()
        if is_instance_valid(cell) then
            local button = cell:find_child("Button")
            local callable = Callable(function()self["onPressed"](self, i )end)
            button.pressed:connect(callable)
            hBoxContainer:add_child(cell)
        end
    end
end

---@param value integer
function Cave_List:onPressed(value)
--    print(tostring(value))
    ---@type HSlider
    local hSlider = Cave_H_Slider_Data.hSlider
    hSlider:set_value(value) --_no_signal
--    Sound_Effect_Action:onChanged(value)
end

return Cave_List

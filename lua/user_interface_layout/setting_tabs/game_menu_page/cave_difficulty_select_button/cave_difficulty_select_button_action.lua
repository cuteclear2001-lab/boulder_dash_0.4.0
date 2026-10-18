--res://lua/user_interface_layout/setting_tabs/game_menu_page/cave_difficulty_select_button/cave_difficulty_select_button_action.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.user_interface_layout.setting_tabs.game_menu_page.cave_difficulty_select_button.cave_difficulty_select_button_data")
local Menu_State = require("lua.feature.action.state.menu_state")

---@class Action.Cave_Difficulty_Select_Button
local Cave_Difficulty_Select_Button = {
}

---@param button Button
function Cave_Difficulty_Select_Button:init(button)
    Data.button = button
    self:setup()
end

function Cave_Difficulty_Select_Button:setup()
    ---@type Button
    local button = Data.button
    local callable = Callable(function()self["onPressed"](self)end)
    button.pressed:connect(callable)
end

function Cave_Difficulty_Select_Button:onPressed()
--    print("Cave_Difficulty_Select_Button:onPressed()")
    Menu_State:switch(Enum_Data.MENU_STATE.CAVE_DIFFICULTY_SELECTED_TOGGLE)
end

return Cave_Difficulty_Select_Button

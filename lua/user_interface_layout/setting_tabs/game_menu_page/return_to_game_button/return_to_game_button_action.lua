--res://lua/user_interface_layout/setting_tabs/game_menu_page/return_to_game_button/return_to_game_button_action.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.user_interface_layout.setting_tabs.game_menu_page.return_to_game_button.return_to_game_button_data")
local Menu_State = require("lua.feature.action.state.menu_state")

---@class Action.Return_To_Game_Button
local Return_To_Game_Button = {
}

---@param button Button
function Return_To_Game_Button:init(button)
    Data.button = button
    self:setup()
end

function Return_To_Game_Button:setup()
    ---@type Button
    local button = Data.button
    local callable = Callable(function()self["onPressed"](self)end)
    button.pressed:connect(callable)
end

function Return_To_Game_Button:onPressed()
    Menu_State:switch(Enum_Data.MENU_STATE.SETTING_TABS_TOGGLE)
end

return Return_To_Game_Button

--res://lua/user_interface_layout/setting_tabs/game_menu_page/new_game_button/new_game_button_action.lua
local Data = require("lua.user_interface_layout.setting_tabs.game_menu_page.new_game_button.new_game_button_data")

---@class Action.New_Game_Button
local New_Game_Button = {
}

---@param button Button
function New_Game_Button:init(button)
    Data.button = button
    self:setup()
end

function New_Game_Button:setup()
    ---@type Button
    local button = Data.button
    local callable = Callable(function()self["onPressed"](self)end)
    button.pressed:connect(callable)
end

function New_Game_Button:onPressed()
    Data.on_pressed()
--    print("New_Game_Button:onPressed()")
end

return New_Game_Button

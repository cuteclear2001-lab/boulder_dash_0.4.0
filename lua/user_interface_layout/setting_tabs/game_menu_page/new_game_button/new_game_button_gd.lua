--res://lua/user_interface_layout/setting_tabs/game_menu_page/new_game_button/new_game_button_gd.lua
local Action = require("lua.user_interface_layout.setting_tabs.game_menu_page.new_game_button.new_game_button_action")

---@class Gd.New_Game_Button:Button
local New_Game_Button = {
    extends = Button,
}

function New_Game_Button:_ready()
    self:init()
end

function New_Game_Button:init()
    Action:init(self)
end

return New_Game_Button

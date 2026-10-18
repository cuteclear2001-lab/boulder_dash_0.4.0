--res://lua/user_interface_layout/setting_tabs/game_menu_page/cave_difficulty_select_button/cave_difficulty_select_button_gd.lua
local Action = require("lua.user_interface_layout.setting_tabs.game_menu_page.cave_difficulty_select_button.cave_difficulty_select_button_action")

---@class Gd.Cave_Difficulty_Select_Button:Button
local Cave_Difficulty_Select_Button = {
    extends = Button,
}

function Cave_Difficulty_Select_Button:_ready()
    self:init()
end

function Cave_Difficulty_Select_Button:init()
    Action:init(self)
end

return Cave_Difficulty_Select_Button

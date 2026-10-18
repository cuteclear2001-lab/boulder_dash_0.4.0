--res://lua/user_interface_layout/top_buttons/setting_button/setting_button_action.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.user_interface_layout.top_buttons.setting_button.setting_button_data")
local Setting_Tabs_Action = require("lua.user_interface_layout.setting_tabs.setting_tabs_action")
local Texture_Resource = require("lua.feature.action.draw.texture_resource")

---@class Action.Setting_Button
local Setting_Button = {
}

function Setting_Button:init(button)
    Data.button = button
    self:setup()
end

function Setting_Button:setup()
    ---@type Button
    local button = Data.button
    local atlas_texture = Texture_Resource:queryAtlasTexture(Enum_Data.RECT.GEAR)
    local callable = Callable(function()self["onPressed"](self)end)
--    button:set("icon", atlas_texture)
    button:set_button_icon(atlas_texture)
    button.pressed:connect(callable)
end

function Setting_Button:onPressed()
    Setting_Tabs_Action:toggle()
end

return Setting_Button

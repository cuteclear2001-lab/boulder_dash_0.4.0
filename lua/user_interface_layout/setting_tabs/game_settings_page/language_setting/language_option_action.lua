--res://lua/user_interface_layout/setting_tabs/game_settings_page/language_setting/language_option_action.lua
local Data = require("lua.user_interface_layout.setting_tabs.game_settings_page.language_setting.language_option_data")
local Config = require("lua.feature.action.config")
local User_Setting = require("lua.feature.data.user_setting")

---@class Action.Language_Option
local Language_Option = {
}

---@param optionButton OptionButton
function Language_Option:init(optionButton)
    Data.optionButton = optionButton
    local language_option_list = User_Setting.LANGUAGE_OPTION_LIST
    for _, v in ipairs(language_option_list) do
        optionButton:add_item(v[2])
    end
    local callable = Callable(function(index)self["onSelected"](self, index)end)
    optionButton:connect("item_selected", callable)
end

function Language_Option:selectConfig()
    local temp = Config:load()[User_Setting.SETTINGS][User_Setting.LANG]
    local language_option_list = User_Setting.LANGUAGE_OPTION_LIST
    local index = 0
    for k, v in ipairs(language_option_list) do
        if temp == v[1] then
            TranslationServer:set_locale(temp)
            index = k
        end
    end
    Data.optionButton:select(index - 1)
end

---@param index integer
function Language_Option:onSelected(index)
    local locale = User_Setting.LANGUAGE_OPTION_LIST[index + 1]
    local locale_name = locale[1]
    TranslationServer:set_locale(locale_name)
    Config:saveSetting(User_Setting.SETTINGS, User_Setting.LANG, locale_name)
end

return Language_Option

--res://lua/feature/action/config.lua
local Data = require("lua.feature.data.config")
local User_Setting = require("lua.feature.data.user_setting")

---@class Action.Config
local Config = {
}

function Config:loadDefault()
    return User_Setting.DEFAULT_CONFIG
end

---@return table<string, table<string, string>>
function Config:load()
    if Data.loaded_flag then
        return User_Setting.cached_config
    end
    local default_config = self:loadDefault()
    local config = ConfigFile:new()
    local error = config:load(User_Setting.SAVE_PATH)
    User_Setting.cached_config = self:deepCopy(default_config)
    if error == OK then
        for section_k, section_v in pairs(default_config) do
            if type(section_v) == "table" then
                for k, _ in pairs(section_v) do
                    if config:has_section_key(section_k, k) then
                        User_Setting.cached_config[section_k][k] = config:get_value(section_k, k)
                    end
                end
            end
        end
    end
    self:save()
    Data.loaded_flag = true
    return User_Setting.cached_config
end

---@param section_k string
---@param key string
---@param value string
function Config:saveSetting(section_k, key, value)
    self:load()[section_k][key] = value
    self:save()
end

function Config:save()
    local config = ConfigFile:new()
    for section_k, section_v in pairs(User_Setting.cached_config) do
        if type(section_v) == "table" then
            for k, v in pairs(section_v) do
                config:set_value(section_k, k, v)
            end
        end
    end
    local error = config:save(User_Setting.SAVE_PATH)
    if error ~= OK then
        print("【錯誤】設定檔存檔失敗，代碼：", error)
    end
end

---@param orig any
---@return any
function Config:deepCopy(orig)
    if type(orig) ~= "table" then
        return orig
    end
    local copy = {}
    for k, v in pairs(orig) do
        copy[k] = self:deepCopy(v)
    end
    return copy
end

return Config

--res://lua/feature/action/collect_tracker.lua
local Data = require("lua.feature.data.collect_tracker")
--local Rect = require("lua.feature.action.rect")
local Sound_Player = require("lua.feature.action.sound.sound_player")
--local Droper = require("lua.feature.action.game.droper")
local Sprite_Manager = require("lua.feature.action.object.sprite.manager")

---@class Action.Collect_Tracker
local Collect_Tracker = {
}

function Collect_Tracker:init()
    Sprite_Manager:init()
    Sound_Player:init()
-- --    Droper:init()
--     Sprite_Manager:init()
--     self:add(Rect)
--    self:add(Droper)
    self:add(Sprite_Manager)
--    self:add(Sound_Player)
end

---@param obj table
function Collect_Tracker:add(obj)
    local data = Data.data
    data[obj] = true
end

function Collect_Tracker:freeObject()
    local data = Data.data
    for k, _ in pairs(data) do
        k:freeObject()
    end
end

return Collect_Tracker

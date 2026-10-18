--res://lua/feature/action/heart.lua
local Data = require("lua.feature.data.heart")
local Frame_Per_Second_Action = require("lua.user_interface_layout.info_frame.frame_per_second.frame_per_second_action")
local Memory_Label_Action = require("lua.user_interface_layout.info_frame.memory_label.memory_label_action")
local Performance_Label_Action = require("lua.user_interface_layout.info_frame.performance_label.performance_label_action")
local Game = require("lua.feature.action.game.game")
local Rockford = require("lua.feature.action.object.sprite.rockford")
local Droper = require("lua.feature.action.game.droper")
local Bomber = require("lua.feature.action.game.bomber")
local Creature_Mover = require("lua.feature.action.game.creature_mover")
local Sprite_Manager = require("lua.feature.action.object.sprite.manager")
--local Explosion_Deferred = require("lua.feature.action.explosion_deferred")

---@class Action.Heart
local Heart = {
}

function Heart:init()
--    Rockford:init()
    self:add(Game)
    self:add(Rockford)
    self:add(Creature_Mover)
    self:add(Bomber)
    self:add(Droper)
--    self:add(Explosion_Deferred)
    self:add(Frame_Per_Second_Action)
    self:add(Memory_Label_Action)
    self:add(Performance_Label_Action)
end

---@param delta float
function Heart:heart(delta)
    local data = Data.data
    for _, v in ipairs(data) do
        if v ~= nil then
            local f = v.heart
            if f ~= nil then
                v:heart(delta)
            end
        end
    end
    Sprite_Manager:flushSprite()
end

---@param obj table
function Heart:add(obj)
    local data = Data.data
    local index = #data + 1
    data[index] = obj
end

---@param index integer
function Heart:remove(index)
    local data = Data.data
    data[index] = nil
end

return Heart

--res://lua/world_layout/world_gd.lua
local Action = require("lua.world_layout.world_action")

---@class Gd.World
local World = {
    extends = Node2D,
}

function World:_ready()
    self:init()
end

function World:init()
    Action:init(self)
end

---@param event InputEvent
function World:_input(event)
    Action:input(event)
end

---@param delta float
function World:_process(delta)
    Action:process(delta)
end

function World:_draw()
    Action:draw()
end

---@param what any
function World:_notification(what)
    Action:notification(what)
end

return World

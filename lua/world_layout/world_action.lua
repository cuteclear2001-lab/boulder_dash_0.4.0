--res://lua/world_layout/world_action.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.world_layout.world_data")
local Heart = require("lua.feature.action.heart")
local Control = require("lua.feature.action.control")
local Menu_State = require("lua.feature.action.state.menu_state")
local Drawer = require("lua.feature.action.draw.drawer")
local Collect_Tracker = require("lua.feature.action.collect_tracker")

---@class Action.World
local World = {
}

---@param node2D Node2D
function World:init(node2D)
    Data.node2D = node2D
    Collect_Tracker:init()
    Heart:init()
    Menu_State:switch(Enum_Data.MENU_STATE.GAME_OPENING)
--    print(string.format("%s, %s", "World:init(node2D)", tostring(node2D)))
end

---@param event InputEvent
function World:input(event)
    if Control:action(event) then
        if event.keycode ~= nil then
            ---@type Node2D
            local node2D = Data.node2D
            node2D:get_viewport():set_input_as_handled()
        end
    end
end

---@param delta float
function World:process(delta)
    Control:actionReleased()
    Control:actionDelta(delta)
    Heart:heart(delta)
    Data.node2D:queue_redraw()
end

function World:draw()
    Drawer:draw()
end

---@param what any
function World:notification(what)
    if what == Node.NOTIFICATION_WM_CLOSE_REQUEST then
        Collect_Tracker:freeObject()
        collectgarbage("collect")
    end
end

return World

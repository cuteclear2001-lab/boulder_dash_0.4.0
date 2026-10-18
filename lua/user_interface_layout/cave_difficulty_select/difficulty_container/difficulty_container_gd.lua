--res://lua/user_interface_layout/cave_difficulty_select/difficulty_container/difficulty_container_gd.lua
local Action = require("lua.user_interface_layout.cave_difficulty_select.difficulty_container.difficulty_container_action")

---@class Gd.Difficulty_Container:VBoxContainer
local Difficulty_Container = {
    extends = VBoxContainer,
}

function Difficulty_Container:_ready()
    self:init()
end

function Difficulty_Container:init()
    Action:init(self)
end

---@param cave integer
---@param difficulty integer
function Difficulty_Container:onPressedDifficulty(cave, difficulty)
    Action:onPressed(cave, difficulty)
end

return Difficulty_Container

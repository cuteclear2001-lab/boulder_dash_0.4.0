--res://lua/feature/action/command/test.lua

---@class Command.Test
local Test = {
}

function Test:action()
end

function Test:actionReleased()
end

---@param delta float
function Test:actionDelta(delta)
end

return Test

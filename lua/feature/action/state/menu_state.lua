--res://lua/feature/action/state/menu_state.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.feature.data.state.menu_state")

---@class Action.Menu_State
local Menu_State = {
}

---@param menu_state MENU_STATE
function Menu_State:switch(menu_state)
    local visible_table = Data.visible_table[menu_state]
    if visible_table == nil then
        return
    end
    for k, v in pairs(visible_table) do
        local node = Data.node_table[k]
        local control = node.control or node.button or node.label
        if type(v) == "boolean" then
            control.visible = v
        elseif type(v) == "number" then
            control.visible = not control.visible
        end
    end
end

return Menu_State

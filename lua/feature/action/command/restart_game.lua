--res://lua/feature/action/command/restart_game.lua
local Enum_Data = require("lua.enum.enum_data")
local Game_Data = require("lua.feature.data.game.game")
local Game = require("lua.feature.action.game.game")

---@class Command.Restart_Game
local Restart_Game = {
}

function Restart_Game:action()
    if Game_Data[Enum_Data.CAVE_TYPE.CURRENT_STATE] == Enum_Data.GAME_STATE.GAMING then
        local module_resource = Game_Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
        if module_resource == nil or not Game_Data[Enum_Data.CAVE_TYPE.LOAD_FLAG] then
            return
        end
        Game:restartGame()
    end
end

return Restart_Game

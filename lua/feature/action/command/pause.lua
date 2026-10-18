--res://lua/feature/action/command/pause.lua
local Enum_Data = require("lua.enum.enum_data")
local Game_Data = require("lua.feature.data.game.game")
local Menu_State_Data = require("lua.feature.data.state.menu_state")
local Menu_State = require("lua.feature.action.state.menu_state")
local Sprite_Manager = require("lua.feature.action.object.sprite.manager")
local Game_State_Label = require("lua.user_interface_layout.game_message.game_state_label.game_state_label_action")

---@class Command.Pause
local Pause = {
}

function Pause:action()
--    print("Pause:action, ")
    local current_state = Game_Data[Enum_Data.CAVE_TYPE.CURRENT_STATE]
    if Enum_Data.GAME_STATE.GAME_OVER == current_state or Enum_Data.GAME_STATE.GAMING ~= current_state then
        return
    else
    end
    Game_Data[Enum_Data.CAVE_TYPE.PAUSE_FLAG] = not Game_Data[Enum_Data.CAVE_TYPE.PAUSE_FLAG]
    if Game_Data[Enum_Data.CAVE_TYPE.PAUSE_FLAG] then
        Game_State_Label:update(Menu_State_Data.state_text[Enum_Data.GAME_STATE_VIEW.PAUSE])
    else
    end
    Menu_State:switch(Enum_Data.MENU_STATE.PAUSE_TOGGLE)
    Sprite_Manager:pauseObject()
    -- local sprite = Rockford_Data[Enum_Data.SPRITE_TYPE.SELF_SPRITE]
    -- if is_instance_valid(sprite) then -- and sprite:can_process()
    --     if Game_Data[Enum_Data.CAVE_TYPE.PAUSE_FLAG] then
    --         sprite.process_mode = Node.PROCESS_MODE_DISABLED
    --     else
    --         sprite.process_mode = Node.PROCESS_MODE_INHERIT
    --     end
    -- else
    -- end
   --is_instance_valid
   --:can_process()
    -- local current_state = Game_Data[Enum_Data.CAVE_TYPE.CURRENT_STATE]
    -- local countdown_time = Game_Data[Enum_Data.CAVE_TYPE.COUNTDOWN_TIME]
    -- if countdown_time > .0 then
    --     if Enum_Data.GAME_STATE.PAUSE ~= current_state then
    --         Game_Data[Enum_Data.CAVE_TYPE.CURRENT_STATE] = Enum_Data.GAME_STATE.PAUSE
    --     else
    --         Game_Data[Enum_Data.CAVE_TYPE.CURRENT_STATE] = Enum_Data.GAME_STATE.COUNTDOWN
    --     end
    -- else
    -- end
end

return Pause

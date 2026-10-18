---res://lua/feature/action/object/cave/cave_difficulty.lua
local Enum_Data = require("lua.enum.enum_data")
local Data = require("lua.feature.data.object.cave.cave_difficulty")
local Game_Data = require("lua.feature.data.game.game")
local Menu_State_Data = require("lua.feature.data.state.menu_state")
local Menu_State = require("lua.feature.action.state.menu_state")
local Config = require("lua.feature.action.config")
local User_Setting = require("lua.feature.data.user_setting")
local Game_State_Label_Action = require("lua.user_interface_layout.game_message.game_state_label.game_state_label_action")
-- local Cave_H_Slider_Data = require("lua.user_interface_layout.cave_difficulty_select.cave_h_slider.cave_h_slider_data")
-- local Cave_H_Slider_Action = require("lua.user_interface_layout.cave_difficulty_select.cave_h_slider.cave_h_slider_action")
local Difficulty_Container_Action = require("lua.user_interface_layout.cave_difficulty_select.difficulty_container.difficulty_container_action")
-- local Sprite_Manager = require("lua.feature.action.object.sprite.manager")

---@class Action.Cave_Difficulty
local Cave_Difficulty = {
}

function Cave_Difficulty:nextLevel()
    local cave = Game_Data[Enum_Data.CAVE_TYPE.CAVE]
    local difficulty = Game_Data[Enum_Data.CAVE_TYPE.DIFFICULTY]
    Game_Data[Enum_Data.CAVE_TYPE.PAUSE_FLAG] = not Game_Data[Enum_Data.CAVE_TYPE.PAUSE_FLAG]
    Game_State_Label_Action:update(Menu_State_Data.state_text[Enum_Data.GAME_STATE_VIEW.CAVE_SELECT])
    Menu_State:switch(Enum_Data.MENU_STATE.PAUSE_TOGGLE)
    Data.pause_game()
    local data = Data.data
    local max_cave = #data + 1 -- ?
    local max_difficulty = data[cave]
    local next_difficulty = difficulty + 1
    local next_cave = cave
    if next_difficulty > max_difficulty then
        if next_cave > max_cave then
            next_cave = cave
            next_difficulty = difficulty
        else
            next_cave = cave + 1
            next_difficulty = 1
        end
    else
    end
    -- local temp = Config:load()[User_Setting.SETTINGS]
    local temp_unlocked = Config:load()[User_Setting.UNLOCKED]
    local temp_cave = tonumber(temp_unlocked[User_Setting.CAVE]) or 0
    local temp_difficulty = tonumber(temp_unlocked[User_Setting.DIFFICULTY]) or 1
    if next_cave > temp_cave then
    else
        next_cave = temp_cave
    end
    if next_difficulty > temp_difficulty then
    else
        next_difficulty = temp_difficulty
    end
    if next_cave ~= temp_cave then
        Config:saveSetting(User_Setting.UNLOCKED, User_Setting.CAVE, tostring(next_cave))
        -- print("try save cave")
    else
    end
    if next_difficulty ~= temp_difficulty then
        Config:saveSetting(User_Setting.UNLOCKED, User_Setting.DIFFICULTY, tostring(next_difficulty))
        -- print("try save difficulty")
    else
    end
    -- ---@type HSlider
    -- local hSlider = Cave_H_Slider_Data.hSlider
    -- hSlider:set_value(next_cave)
    -- Cave_H_Slider_Action:onChanged(next_cave)
    Menu_State:switch(Enum_Data.MENU_STATE.CAVE_DIFFICULTY_SELECTED_TOGGLE)
    Difficulty_Container_Action:setup(next_cave)
    -- print(string.format("%s, [%d, %d]", "next", next_cave, next_difficulty))
    --Config:saveSetting(section_k, key, value)
    -- Sprite_Manager:pauseObject()
end

return Cave_Difficulty

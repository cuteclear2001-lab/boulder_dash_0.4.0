--res://lua/user_interface_layout/cave_difficulty_select/difficulty_container/difficulty_container_action.lua
local Enum_Data = require("lua.enum.enum_data")
local Main_Data = require("lua.feature.data.main")
local Cave_Difficulty_Data = require("lua.feature.data.object.cave.cave_difficulty")
local Data = require("lua.user_interface_layout.cave_difficulty_select.difficulty_container.difficulty_container_data")
--local Menu_State = require("lua.feature.action.state.menu_state")
--local Game = require("lua.feature.action.game.game")
local Config = require("lua.feature.action.config")
local User_Setting = require("lua.feature.data.user_setting")

---@class Action.Difficulty_Container
local Difficulty_Container = {
}

---@param vBoxContainer VBoxContainer
function Difficulty_Container:init(vBoxContainer)
    Data.vBoxContainer = vBoxContainer
    local unlocked = Config:load()[User_Setting.UNLOCKED]
    local temp_cave = tonumber(unlocked[User_Setting.CAVE]) or 0
--    local temp_difficulty = tonumber(unlocked[User_Setting.DIFFICULTY]) or 1
--    print(string.format("%s, %d, %d", "Difficulty_Container:setup", temp_cave, temp_difficulty))
    self:setup(temp_cave)
end

---@param value integer
function Difficulty_Container:setup(value)
    -- print("Difficulty_Container:setup(value)"..value)
    ---@type VBoxContainer
    local vBoxContainer = Data.vBoxContainer
    -- vBoxContainer:call_deferred("_processDeferred")
    local children = vBoxContainer:get_children()
    for _, v in pairs(children) do
        if is_instance_valid(v) then
            v:queue_free()
        end
    end
    local temp_unlocked = Config:load()[User_Setting.UNLOCKED]
    local temp_cave = tonumber(temp_unlocked[User_Setting.CAVE]) or 0
    local temp_difficulty = tonumber(temp_unlocked[User_Setting.DIFFICULTY]) or 1
    local level_pes_row = Main_Data.LEVEL_PES_ROW
    local difficulty_button_list_resource = Data.difficulty_button_list_resource
    local difficulty_button_resource = Data.difficulty_button_resource
    local max_difficulty_size = Cave_Difficulty_Data.data[value]
    for start_index = 1, max_difficulty_size, level_pes_row do
        local difficulty_button_list = difficulty_button_list_resource:instantiate()
        if is_instance_valid(difficulty_button_list) then
            vBoxContainer:add_child(difficulty_button_list)
        end
        local end_index = math.min(start_index + level_pes_row - 1, max_difficulty_size)
        for button_index = start_index, end_index do
            local difficulty_button = difficulty_button_resource:instantiate()
            if is_instance_valid(difficulty_button) then
                local textureRectButton = difficulty_button:find_child("TextureRectButton")
                local textureRectLabel = difficulty_button:find_child("TextureRectLabel")
                local show_difficulty_flag = false
                if temp_cave > value then
                    show_difficulty_flag = true
                end
                if temp_cave == value and temp_difficulty >= button_index then
                    show_difficulty_flag = true
                end
                if show_difficulty_flag then
                    textureRectButton.visible = true
                    textureRectLabel.visible = false
                    local button = difficulty_button:find_child("Button")
                    difficulty_button_list:add_child(difficulty_button)
                    button.text = string.format("%03d", button_index)
                    -- local callable = Callable(vBoxContainer, "onPressedDifficulty"):bind(value):bind(button_index)
                    -- local callable = Callable(function()self["onPressed"](self, value, button_index)end)
                    local callable = Callable(vBoxContainer, "onPressedDifficulty"):bind(button_index):bind(value)
                    button.pressed:connect(callable)
                else
                    textureRectButton.visible = false
                    textureRectLabel.visible = true
                    local button = difficulty_button:find_child("Label")
                    difficulty_button_list:add_child(difficulty_button)
                    button.text = string.format("%03d", button_index)
                end
            end
        end
    end
end

---@param cave integer
---@param difficulty integer
function Difficulty_Container:onPressed(cave, difficulty)
    -- print(string.format("%d, %d", cave, difficulty))
    Data.on_pressed(cave, difficulty)
    -- if Game:canLoadData(cave, difficulty) then
    --     Game:startLoadData(cave, difficulty)
    --     if Game:canBeginGame() then
    --         Menu_State:switch(Enum_Data.MENU_STATE.COUNTDOWN)
    --         --Game:startCountdown(Main_Data.GAME_COUNTDOWN)
    --     end
    -- else
    -- end
end

return Difficulty_Container

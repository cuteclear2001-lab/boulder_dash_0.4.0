--res://lua/feature/action/game/game.lua
local Enum_Data = require("lua.enum.enum_data")
local Rockford_Data = require("lua.feature.data.object.sprite.rockford")
local Exit_Door_Data = require("lua.feature.data.object.sprite.exit_door")
--local Main_Data = require("lua.feature.data.main")
local Data = require("lua.feature.data.game.game")
local Config = require("lua.feature.action.config")
local User_Setting = require("lua.feature.data.user_setting")
--local Cave_Difficulty_Select_Data = require("lua.user_interface_layout.cave_difficulty_select.cave_difficulty_select_data")
local Cave_Difficulty_Data = require("lua.feature.data.object.cave.cave_difficulty")
local Menu_State_Data = require("lua.feature.data.state.menu_state")
local Menu_State = require("lua.feature.action.state.menu_state")
local Attribute_Board_Action = require("lua.user_interface_layout.attribute_board.attribute_board_action")
local Countdown_Label_Action = require("lua.user_interface_layout.game_message.countdown_label.countdown_label_action")
local Difficulty_Container_Data = require("lua.user_interface_layout.cave_difficulty_select.difficulty_container.difficulty_container_data")
local New_Game_Button_Data = require("lua.user_interface_layout.setting_tabs.game_menu_page.new_game_button.new_game_button_data")
local Bomber_Data = require("lua.feature.data.game.bomber")
local Sprite_Manager = require("lua.feature.action.object.sprite.manager")
local Calculator = require("lua.feature.action.calculator")
local Rockford = require("lua.feature.action.object.sprite.rockford")
local Game_State_Label_Action = require("lua.user_interface_layout.game_message.game_state_label.game_state_label_action")
local copyModuleResource = nil
local copyObjectModuleResource = nil
local hasSpriteQueryBlock = nil
local overTimeGameOver = nil

---@class Action.Game
local Game = {
}

overTimeGameOver = function()
    local module_resource = Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
    if module_resource == nil or not Data[Enum_Data.CAVE_TYPE.LOAD_FLAG] then
        return
    end
    local cave_object_data = module_resource[Enum_Data.MODULE_RESOURCE.OBJECT_DATA]
    local cave_data_y = #cave_object_data
    local cave_data_x = #cave_object_data[1]
    for y = cave_data_y - 1, 1, -1 do
        local row = cave_object_data[y]
        for x = 2, cave_data_x - 1 do
            local tile_cell = row[x]
            local tile_cell_list = tile_cell[Enum_Data.TILE_CELL_TYPE.LIST]
            for sprite, sprite_data in pairs(tile_cell_list) do
                local block, _ = Calculator:queryBlockType(sprite)
                if Enum_Data.BLOCK.ROCKFORD == block then
                    local current_cell = sprite_data[Enum_Data.SPRITE_DATA.CURRENT_CELL]
                    if current_cell then
                        Sprite_Manager:enqueueSprite(Enum_Data.BLOCK.BOMB, current_cell, nil)
                        Bomber_Data[Enum_Data.BOMBER_TYPE.GAME_OVER_ACTION]()
                        return
                    else
                    end
                end
            end
        end
    end
end

---@param block BLOCK
---@return bool
hasSpriteQueryBlock = function(block)
    local flag = false
    local blocks = Data[Enum_Data.CAVE_TYPE.SPRITE_QUERY_BLOCK]
    for _, v in ipairs(blocks) do
        if v == block then
            return true
        else
        end
    end
    return flag
end

---@param source_data BLOCK[][]
---@param destination_data BLOCK[][]
copyModuleResource = function(source_data, destination_data)
    local cave_data_y = #source_data
    local cave_data_x = #source_data[1]
    for y = 1, cave_data_y do
        local mod_row = source_data[y]
        local row = {}
        destination_data[y] = row
        for x = 1, cave_data_x do
            row[x] = mod_row[x]
        end
    end
end

---@param source_data BLOCK[][]
---@param destination_data table[][]
copyObjectModuleResource = function(source_data, destination_data)
    local cave_data_y = #source_data
    local cave_data_x = #source_data[1]
    -- local test_flag = nil
    for y = 1, cave_data_y do
        local mod_row = source_data[y]
        destination_data[y] = {}
        for x = 1, cave_data_x do
            local row = {}
            local block = mod_row[x]
            local tile_cell = Sprite_Manager:queryTileCcell(row, x, y)
            -- local tile_cell = {
            --     [Enum_Data.TILE_CELL_TYPE.LIST] = row,
            --     [Enum_Data.TILE_CELL_TYPE.POSITION] = {x, y},
            -- }
            local sprite = Sprite_Manager:query(block, tile_cell)
            if sprite then
                if hasSpriteQueryBlock(block) then
                    local sprite_data = Sprite_Manager:querySpriteData(tile_cell)
                    -- local sprite_data = {
                    --         [Enum_Data.SPRITE_DATA.CURRENT_CELL] = tile_cell,
                    --         [Enum_Data.SPRITE_DATA.MOVED_FLAG] = false,
                    --         [Enum_Data.SPRITE_DATA.TARGET_CELL] = nil,
                    --     }
                    row[sprite] = sprite_data
                    if Enum_Data.BLOCK.ROCKFORD == block then
                        Rockford_Data[Enum_Data.SPRITE_TYPE.SELF_DATA] = sprite_data
                    elseif Enum_Data.BLOCK.EXIT_DOOR == block then
                        Exit_Door_Data[Enum_Data.SPRITE_TYPE.SELF_DATA] = sprite_data
                    end
                else
                    row[sprite] = true
                end
                -- if not test_flag then
                --     test_flag = sprite
                -- end
--                table.insert(row, sprite)
            end
            destination_data[y][x] = tile_cell
        end
    end
    -- if test_flag then
    --     Sprite_Manager:removeSprite2D(test_flag)
    -- end
end

function Game:init()
end

---@param delta float
function Game:heart(delta)
    if Data[Enum_Data.CAVE_TYPE.PAUSE_FLAG] then
        return
    end
    local current_state = Data[Enum_Data.CAVE_TYPE.CURRENT_STATE]
    if current_state == Enum_Data.GAME_STATE.COUNTDOWN then
        local countdown_time = Data[Enum_Data.CAVE_TYPE.COUNTDOWN_TIME]
        countdown_time = countdown_time - delta
        if countdown_time <= .0 then
            countdown_time = .0
            Game:finishCountdown()
        end
        Data[Enum_Data.CAVE_TYPE.COUNTDOWN_TIME] = countdown_time
        Countdown_Label_Action:update(countdown_time)
        return
    end
    if current_state == Enum_Data.GAME_STATE.GAMING then
        local mod = Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
        if mod == nil or type(mod) ~= "table" then
            return
        end
        local remaining_time = mod[Enum_Data.MODULE_RESOURCE.REMAINING_TIME]
        Data[Enum_Data.CAVE_TYPE.CURRENT_TIME] = Data[Enum_Data.CAVE_TYPE.CURRENT_TIME] + delta
        local display_time = math.floor(remaining_time - Data[Enum_Data.CAVE_TYPE.CURRENT_TIME])
        Attribute_Board_Action:updateTime(display_time)
        if display_time <= 0 then
            overTimeGameOver()
        end
        return
    end
--    Count_Label_Action:update(tostring(delta))
end

---@param countdown_time float
function Game:startCountdown(countdown_time)
    ---@type table<MODULE_RESOURCE, any>
    local mod = Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
    Attribute_Board_Action:update(Enum_Data.ATTRIBUTE.SCORE
        , string.format("%03d", 0)) -- ?
    Attribute_Board_Action:update(Enum_Data.ATTRIBUTE.GAME_LEVEL
        , string.format("%02d-%02d", Data[Enum_Data.CAVE_TYPE.CAVE], Data[Enum_Data.CAVE_TYPE.DIFFICULTY])) -- ?
    local diamonds_required = mod[Enum_Data.MODULE_RESOURCE.DIAMONDS_REQUIRED]
    Attribute_Board_Action:updateDiamonds(diamonds_required)
    local remaining_time = mod[Enum_Data.MODULE_RESOURCE.REMAINING_TIME]
    Attribute_Board_Action:updateTime(remaining_time)
    Data[Enum_Data.CAVE_TYPE.COUNTDOWN_TIME] = countdown_time
    Countdown_Label_Action:update(countdown_time)
    Data[Enum_Data.CAVE_TYPE.CURRENT_STATE] = Enum_Data.GAME_STATE.COUNTDOWN
    Data[Enum_Data.CAVE_TYPE.CURRENT_TIME] = .0
end

function Game:finishCountdown()
    Menu_State:switch(Enum_Data.MENU_STATE.GAMING)
    Data[Enum_Data.CAVE_TYPE.CURRENT_STATE] = Enum_Data.GAME_STATE.GAMING
--    self:startBeginGame()
end

---@param cave integer
---@param difficulty integer
function Game:canLoadData(cave, difficulty)
    local module_path = string.format(Cave_Difficulty_Data.data_file_string, cave, difficulty)..".lua"
--    print("try load..."..tostring(module_path))
    if ResourceLoader:exists(module_path) then
--        print("???")
        return true
    else
    end
    return false
end

---@return bool
function Game:canBeginGame()
    local flag = Data[Enum_Data.CAVE_TYPE.LOAD_FLAG]
    return flag
end
---@param cave integer
---@param difficulty integer
function Game:startLoadData(cave, difficulty)
    local begin_clock = os.clock()
    local module_path = string.format(Cave_Difficulty_Data.data_file_string, cave, difficulty)
    local mod = require(module_path)
    local module_resource = Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
    if module_resource == nil or type(module_resource) ~= "table" then
        return
    end
    module_resource[Enum_Data.MODULE_RESOURCE.DIAMONDS_REQUIRED] = mod.diamonds_required
    module_resource[Enum_Data.MODULE_RESOURCE.REMAINING_TIME] = mod.remaining_time
    local mod_ground_data = mod.ground_data
    local ground_data = module_resource[Enum_Data.MODULE_RESOURCE.GROUND_DATA]
    ---@cast ground_data BLOCK[][]
    copyModuleResource(mod_ground_data, ground_data)
    local mod_object_data = mod.object_data
    local object_data = module_resource[Enum_Data.MODULE_RESOURCE.OBJECT_DATA]
    ---@cast object_data table[][]
    copyObjectModuleResource(mod_object_data, object_data)
    Data[Enum_Data.CAVE_TYPE.CAVE] = cave
    Data[Enum_Data.CAVE_TYPE.DIFFICULTY] = difficulty
    Data[Enum_Data.CAVE_TYPE.COUNTDOWN_TIME] = mod.diamonds_required
    Data[Enum_Data.CAVE_TYPE.LOAD_FLAG] = true
    Rockford:enterWorld() -- ?
    Data[Enum_Data.CAVE_TYPE.PAUSE_FLAG] = false
    Sprite_Manager:pauseObject()
    local end_clock = os.clock()
    local cost_clock = end_clock - begin_clock
    print(string.format("%s, %f", "Game:startLoadData cost ... ", cost_clock))
end

---@param cave integer
---@param difficulty integer
Difficulty_Container_Data.on_pressed = function(cave, difficulty)
    -- print(string.format("%s, [%d, %d]", "Difficulty_Container_Data.on_pressed", cave, difficulty))
    local module_resource = Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
    module_resource[Enum_Data.MODULE_RESOURCE.GROUND_DATA] = {}
    module_resource[Enum_Data.MODULE_RESOURCE.OBJECT_DATA] = {}
    Sprite_Manager:freeSpriteTable()
    if Game:canLoadData(cave, difficulty) then
        Game:startLoadData(cave, difficulty)
        if Game:canBeginGame() then
            Menu_State:switch(Enum_Data.MENU_STATE.COUNTDOWN)
            local temp = Config:load()[User_Setting.SETTINGS][User_Setting.COUNT_SETTING]
            local value = tonumber(temp) or 3
            Game:startCountdown(value)
        end
    else
    end
end

function Game:restartGame()
    local cave = Data[Enum_Data.CAVE_TYPE.CAVE]
    local difficulty = Data[Enum_Data.CAVE_TYPE.DIFFICULTY]
    local module_resource = Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
    module_resource[Enum_Data.MODULE_RESOURCE.GROUND_DATA] = {}
    module_resource[Enum_Data.MODULE_RESOURCE.OBJECT_DATA] = {}
    Sprite_Manager:freeSpriteTable()
    if Game:canLoadData(cave, difficulty) then
        Game:startLoadData(cave, difficulty)
        if Game:canBeginGame() then
            Menu_State:switch(Enum_Data.MENU_STATE.COUNTDOWN)
            local temp = Config:load()[User_Setting.SETTINGS][User_Setting.COUNT_SETTING]
            local value = tonumber(temp) or 3
            Game:startCountdown(value)
        end
    else
    end
end

New_Game_Button_Data.on_pressed = function()
    print("New_Game_Button_Data.on_pressed")
    Game:restartGame()
end

Cave_Difficulty_Data.pause_game = function()
    Sprite_Manager:pauseObject()
end

Bomber_Data[Enum_Data.BOMBER_TYPE.GAME_OVER_ACTION] = function()
    local current_state = Data[Enum_Data.CAVE_TYPE.CURRENT_STATE]
    if Enum_Data.GAME_STATE.GAME_OVER ~= current_state then
        Data[Enum_Data.CAVE_TYPE.CURRENT_STATE] = Enum_Data.GAME_STATE.GAME_OVER
        Game_State_Label_Action:update(Menu_State_Data.state_text[Enum_Data.GAME_STATE_VIEW.GAME_OVER])
        Menu_State:switch(Enum_Data.MENU_STATE.PAUSE_TOGGLE)
        Menu_State:switch(Enum_Data.MENU_STATE.CAVE_DIFFICULTY_SELECTED_TOGGLE)
    else
    end
end

--canLoadData
--startLoadData
--finishLoadData

return Game

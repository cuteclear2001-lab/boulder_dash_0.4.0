--res://lua/feature/data/state/menu_state.lua
local Enum_Data = require("lua.enum.enum_data")
local Top_Buttons_Data = require("lua.user_interface_layout.top_buttons.top_buttons_data")
local Setting_Tabs_Data = require("lua.user_interface_layout.setting_tabs.setting_tabs_data")
local Attribute_Board_Data = require("lua.user_interface_layout.attribute_board.attribute_board_data")
local Info_Frame_Data = require("lua.user_interface_layout.info_frame.info_frame_data")
local Cave_Difficulty_Select_Data = require("lua.user_interface_layout.cave_difficulty_select.cave_difficulty_select_data")
local New_Game_Button_Data = require("lua.user_interface_layout.setting_tabs.game_menu_page.new_game_button.new_game_button_data")
local Return_To_game_Button_Data = require("lua.user_interface_layout.setting_tabs.game_menu_page.return_to_game_button.return_to_game_button_data")
local Game_State_Label_Data = require("lua.user_interface_layout.game_message.game_state_label.game_state_label_data")
local Countdown_Label_Data = require("lua.user_interface_layout.game_message.countdown_label.countdown_label_data")

---@class Data.Menu_State
---@field node_table table<MENU, table>
---@field visible_table table<MENU_STATE, table<MENU, bool | integer>>
local Menu_State = {
    state_text = {
        [Enum_Data.GAME_STATE_VIEW.PAUSE] = "Pause",
        [Enum_Data.GAME_STATE_VIEW.GAME_OVER] = "Game Over",
        [Enum_Data.GAME_STATE_VIEW.CAVE_SELECT] = "Cave Select",
    },
    node_table = {
        [Enum_Data.MENU.TOP_BUTTONS] = Top_Buttons_Data,
        [Enum_Data.MENU.SETTING_TABS] = Setting_Tabs_Data,
        [Enum_Data.MENU.ATTRIBUTE_BOARD] = Attribute_Board_Data,
        [Enum_Data.MENU.INFO_FRAME] = Info_Frame_Data,
        [Enum_Data.MENU.CAVE_DIFFICULTY_SELECT] = Cave_Difficulty_Select_Data,
        [Enum_Data.MENU.NEW_GAME_BUTTON] = New_Game_Button_Data,
        [Enum_Data.MENU.RETURN_TO_GAME_BUTTON] = Return_To_game_Button_Data,
        [Enum_Data.MENU.GAME_STATE_LABEL] = Game_State_Label_Data,
        [Enum_Data.MENU.COUNTDOWN_LABEL] = Countdown_Label_Data,
    },
    visible_table = {
        [Enum_Data.MENU_STATE.GAME_OPENING]
            = {
                [Enum_Data.MENU.TOP_BUTTONS] = true,
                [Enum_Data.MENU.SETTING_TABS] = false,
                [Enum_Data.MENU.ATTRIBUTE_BOARD] = false,
                [Enum_Data.MENU.INFO_FRAME] = false,
                [Enum_Data.MENU.CAVE_DIFFICULTY_SELECT] = true,
                [Enum_Data.MENU.NEW_GAME_BUTTON] = false,
                [Enum_Data.MENU.RETURN_TO_GAME_BUTTON] = false,
                [Enum_Data.MENU.GAME_STATE_LABEL] = false,
                [Enum_Data.MENU.COUNTDOWN_LABEL] = false,
            },
        [Enum_Data.MENU_STATE.INFO_FRAME_TOGGLE]
            = {
                [Enum_Data.MENU.INFO_FRAME] = 0,
            },
        [Enum_Data.MENU_STATE.SETTING_TABS_TOGGLE]
            = {
                [Enum_Data.MENU.SETTING_TABS] = 0,
                [Enum_Data.MENU.CAVE_DIFFICULTY_SELECT] = false,
            },
        [Enum_Data.MENU_STATE.CAVE_DIFFICULTY_SELECTED_TOGGLE]
            = {
                [Enum_Data.MENU.SETTING_TABS] = false,
                [Enum_Data.MENU.CAVE_DIFFICULTY_SELECT] = true,
--                [Enum_Data.MENU.GAME_STATE_LABEL] = false,
            },
        [Enum_Data.MENU_STATE.PAUSE_TOGGLE]
            = {
                [Enum_Data.MENU.GAME_STATE_LABEL] = 0,
            },
        [Enum_Data.MENU_STATE.COUNTDOWN]
            = {
                [Enum_Data.MENU.TOP_BUTTONS] = true,
                [Enum_Data.MENU.SETTING_TABS] = false,
                [Enum_Data.MENU.ATTRIBUTE_BOARD] = true,
                [Enum_Data.MENU.CAVE_DIFFICULTY_SELECT] = false,
                [Enum_Data.MENU.NEW_GAME_BUTTON] = true,
                [Enum_Data.MENU.RETURN_TO_GAME_BUTTON] = true,
                [Enum_Data.MENU.GAME_STATE_LABEL] = false,
                [Enum_Data.MENU.COUNTDOWN_LABEL] = true,
            },
        [Enum_Data.MENU_STATE.GAME_NEW_GAME]
            = {
                [Enum_Data.MENU.SETTING_TABS] = false,
                [Enum_Data.MENU.GAME_STATE_LABEL] = false,
                [Enum_Data.MENU.COUNTDOWN_LABEL] = true,
            },
        [Enum_Data.MENU_STATE.GAMING]
            = {
                [Enum_Data.MENU.TOP_BUTTONS] = true,
                [Enum_Data.MENU.SETTING_TABS] = false,
                [Enum_Data.MENU.ATTRIBUTE_BOARD] = true,
                [Enum_Data.MENU.CAVE_DIFFICULTY_SELECT] = false,
                [Enum_Data.MENU.NEW_GAME_BUTTON] = true,
                [Enum_Data.MENU.RETURN_TO_GAME_BUTTON] = true,
                [Enum_Data.MENU.GAME_STATE_LABEL] = false,
                [Enum_Data.MENU.COUNTDOWN_LABEL] = false,
            },
        [Enum_Data.MENU_STATE.GAME_OVER]
            = {
                [Enum_Data.MENU.GAME_STATE_LABEL] = true,
            },
    },
}

return Menu_State

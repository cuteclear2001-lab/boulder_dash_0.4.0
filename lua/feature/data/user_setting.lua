--res://lua/feature/data/user_setting.lua
local CONTROLS = "CONTROLS"
local SETTINGS = "SETTINGS"
local UNLOCKED = "UNLOCKED"
local CUSTOM_UP = "custom_up"
local CUSTOM_DOWN = "custom_down"
local CUSTOM_LEFT = "custom_left"
local CUSTOM_RIGHT = "custom_right"
local CUSTOM_PAUSE = "custom_pause"
local CUSTOM_ESC = "custom_escape"
local CUSTOM_RESTART_GAME = "custom_restart_game"
local CUSTOM_F1 = "custom_f1"
local CUSTOM_TEST = "custom_test"
local LANG = "LANG"
local SOUND_EFFECT = "SOUND_EFFECT"
local COUNT_SETTING = "COUNT_SETTING"
local CAVE = "CAVE"
local DIFFICULTY = "DIFFICULTY"

---@class Data.User_Setting
---@field SAVE_PATH string
---@field CONTROLS string
---@field SETTINGS string
---@field CUSTOM_UP string
---@field CUSTOM_DOWN string
---@field CUSTOM_LEFT string
---@field CUSTOM_RIGHT string
---@field CUSTOM_F1 string
---@field CUSTOM_PAUSE string
---@field CUSTOM_ESC string
---@field CUSTOM_RESTART_GAME string
---@field CUSTOM_TEST string
---@field LANG string
---@field SOUND_EFFECT string
---@field COUNT_SETTING string
---@field DEFAULT_CONFIG table<string, table<string, string>>
---@field cached_config table<string, table<string, string>>
---@field DEFAULT_CONTROLS table<string, string>
---@field LANGUAGE_OPTION_LIST [string, string][]
---@field MOUSE_MAPPING_KEY table<string, integer>
---@field CONTROL_ORDERED_KEYS string[]
local User_Setting = {
    SAVE_PATH = "res://saved/setting_config.cfg",
    CONTROLS = CONTROLS,
    SETTINGS = SETTINGS,
    CUSTOM_UP = CUSTOM_UP,
    CUSTOM_DOWN = CUSTOM_DOWN,
    CUSTOM_LEFT = CUSTOM_LEFT,
    CUSTOM_RIGHT = CUSTOM_RIGHT,
    CUSTOM_PAUSE = CUSTOM_PAUSE,
    CUSTOM_ESC = CUSTOM_ESC,
    CUSTOM_RESTART_GAME = CUSTOM_RESTART_GAME,
    CUSTOM_F1 = CUSTOM_F1,
    CUSTOM_TEST = CUSTOM_TEST,
    LANG = LANG,
    SOUND_EFFECT = SOUND_EFFECT,
    COUNT_SETTING = COUNT_SETTING,
    UNLOCKED = UNLOCKED,
    CAVE = CAVE,
    DIFFICULTY = DIFFICULTY,
    DEFAULT_CONFIG = {
        [CONTROLS] = {
            [CUSTOM_UP] = "W",
            [CUSTOM_DOWN] = "S",
            [CUSTOM_LEFT] = "A",
            [CUSTOM_RIGHT] = "D",
            [CUSTOM_PAUSE] = "Space",
            [CUSTOM_RESTART_GAME] = "R",
        },
        [SETTINGS] = {
            [LANG] = "zh_TW",
            [SOUND_EFFECT] = "50",
            [COUNT_SETTING] = "3",
        },
        [UNLOCKED] = {
            [CAVE] = "0",
            [DIFFICULTY] = "1",
        },
    },
    cached_config = {},
    DEFAULT_CONTROLS = {
        [CUSTOM_ESC] = "Escape",
        [CUSTOM_TEST] = "1",
        [CUSTOM_F1] = "F1",
    },
    LANGUAGE_OPTION_LIST = {
        {"zh_TW", "中文"},
        {"en", "English"},
    },
    MOUSE_MAPPING_KEY = {
        ["Left Mouse Button"] = 1,
        ["Right Mouse Button"] = 2,
        ["Middle Mouse Button"] = 3,
    },
    CONTROL_ORDERED_KEYS = {
        CUSTOM_UP,
        CUSTOM_DOWN,
        CUSTOM_LEFT,
        CUSTOM_RIGHT,
        CUSTOM_PAUSE,
        CUSTOM_RESTART_GAME,
    },
}

return User_Setting

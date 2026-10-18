--res://lua/feature/data/control.lua
local Enum_Data = require("lua.enum.enum_data")
local User_Setting = require("lua.feature.data.user_setting")
local Setting_Tabs_Toggle = require("lua.feature.action.command.setting_tabs_toggle")
local Rockford_Move = require("lua.feature.action.command.rockford_move")
local F1 = require("lua.feature.action.command.f1")
local Test = require("lua.feature.action.command.test")
local Pause = require("lua.feature.action.command.pause")
local Restart_Game = require("lua.feature.action.command.restart_game")

---@class Data.Control
local Control = {
    [User_Setting.CUSTOM_ESC] = {
        [Enum_Data.INVOKE.OBJECT] = Setting_Tabs_Toggle,
    },
    [User_Setting.CUSTOM_UP] = {
        [Enum_Data.INVOKE.OBJECT] = Rockford_Move,
        [Enum_Data.INVOKE.ARGUMENTS] = {Enum_Data.MOVE.UP}
    },
    [User_Setting.CUSTOM_DOWN] = {
        [Enum_Data.INVOKE.OBJECT] = Rockford_Move,
        [Enum_Data.INVOKE.ARGUMENTS] = {Enum_Data.MOVE.DOWN}
    },
    [User_Setting.CUSTOM_LEFT] = {
        [Enum_Data.INVOKE.OBJECT] = Rockford_Move,
        [Enum_Data.INVOKE.ARGUMENTS] = {Enum_Data.MOVE.LEFT}
    },
    [User_Setting.CUSTOM_RIGHT] = {
        [Enum_Data.INVOKE.OBJECT] = Rockford_Move,
        [Enum_Data.INVOKE.ARGUMENTS] = {Enum_Data.MOVE.RIGHT}
    },
    [User_Setting.CUSTOM_F1] = {
        [Enum_Data.INVOKE.OBJECT] = F1,
    },
    [User_Setting.CUSTOM_TEST] = {
        [Enum_Data.INVOKE.OBJECT] = Test,
    },
    [User_Setting.CUSTOM_PAUSE] = {
        [Enum_Data.INVOKE.OBJECT] = Pause,
    },
    [User_Setting.CUSTOM_RESTART_GAME] = {
        [Enum_Data.INVOKE.OBJECT] = Restart_Game,
    },
}

return Control

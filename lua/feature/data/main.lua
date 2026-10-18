--res://lua/feature/data/main.lua

---@class Data.Main
---@field GAME_SIZE_X integer
---@field GAME_SIZE_Y integer
---@field CELL_SIZE integer
---@field LEVEL_PES_ROW integer
---@field MOVED_BUFFER_TIME float
---@field ROCKFORD_MOVE_DURATION float
---@field SOUND_PLAYER_MAX_DISTANCE integer
---@field NODE_PATH_POSITION NodePath
local Main = {
    GAME_SIZE_X = 22,
    GAME_SIZE_Y = 12,
    BLOCK_SIZE = 32,
    LEVEL_PES_ROW = 5,
    MOVED_BUFFER_TIME = 0.12,
    BOMB_SHOW_DURATION = 0.55,
    ROCKFORD_MOVE_DURATION = 0.19,
    ROCKFORD_PUSH_DURATION = 0.22,
    CAMERA_2D_MOVE_DURATION = 0.215,
    CREATURE_MOVE_DURATION = 0.255,
    SPRITE_FALL_DURATION = 0.20,
    SPRITE_HORIZONTAL_DURATION = 0.10,
    SOUND_PLAYER_MAX_DISTANCE = 1400,
    NODE_PATH_POSITION = NodePath("position")
}

return Main

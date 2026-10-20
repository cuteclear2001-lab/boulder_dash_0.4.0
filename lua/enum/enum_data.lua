--res://lua/enum/enum_data.lua

---@class Enum_Data
local Enum_Data = {
}

---@enum MENU
Enum_Data.MENU = {
    TOP_BUTTONS = 1,
    SETTING_TABS = 2,
    ATTRIBUTE_BOARD = 3,
    INFO_FRAME = 4,
    CAVE_DIFFICULTY_SELECT = 5,
    NEW_GAME_BUTTON = 6,
    RETURN_TO_GAME_BUTTON = 7,
    GAME_STATE_LABEL = 8,
    COUNTDOWN_LABEL = 9,
}

---@enum GAME_STATE
Enum_Data.GAME_STATE = {
    UNSELECTED = 1,
    COUNTDOWN = 2,
    GAMING = 3,
    GAME_OVER = 4,
--    PAUSE = 5,
}

---@enum GAME_STATE_VIEW
Enum_Data.GAME_STATE_VIEW = {
    GAME_OVER = 1,
    PAUSE = 2,
    CAVE_SELECT = 3,
}

---@enum MENU_STATE
Enum_Data.MENU_STATE = {
    GAME_OPENING = 1,
    INFO_FRAME_TOGGLE = 2,
    SETTING_TABS_TOGGLE = 3,
    CAVE_DIFFICULTY_SELECTED_TOGGLE = 4,
    COUNTDOWN = 5,
    GAME_NEW_GAME = 6,
    PAUSE_TOGGLE = 7,
    GAMING = 8,
    GAME_OVER = 9,
}

---@enum INVOKE
Enum_Data.INVOKE = {
    OBJECT = 1,
    ARGUMENTS = 2,
}

---@enum MOVE
Enum_Data.MOVE = {
    UP = 1,
    DOWN = 2,
    LEFT = 3,
    RIGHT = 4,
}

---@enum ATTRIBUTE
Enum_Data.ATTRIBUTE = {
    SCORE = 1,
    GAME_LEVEL = 2,
    DIAMONDS_REQUIRED = 3,
    REMAINING_TIME = 4,
}

---@enum GAME_LEVEL
Enum_Data.GAME_LEVEL = {
    CAVE = 0,
    DIFFICULTY = 1,
}

---@enum ROCKFORD_ACTION
Enum_Data.ROCKFORD_ACTION = {
    MOVE_UP = 1,
    MOVE_DOWN = 2,
    MOVE_LEFT = 3,
    MOVE_RIGHT = 4,
    IDLE = 5,
}

---@enum DIAMOND_ACTION
Enum_Data.DIAMOND_ACTION = {
    HEART = 1,
}

---@enum BOULDER_ACTION
Enum_Data.BOULDER_ACTION = {
    HEART = 1,
}

---@enum EXIT_DOOR_ACTION
Enum_Data.EXIT_DOOR_ACTION = {
    IDLE = 1,
    HEART = 2,
}

---@enum EXPLOSION_ACTION
Enum_Data.EXPLOSION_ACTION = {
    HEART = 1,
}

---@enum SKELETON_ACTION
Enum_Data.SKELETON_ACTION = {
    HEART = 1,
}

---@enum BAT_ACTION
Enum_Data.BAT_ACTION = {
    HEART = 1,
}

---@enum BLOCK
Enum_Data.BLOCK = {
    EMPTY = 1,
    DIRT = 2,
    BRICK_WALL = 3,
    STEEL_WALL = 4,
    BOULDER = 5,
    DIAMOND = 6,
    SKELETON = 7,
    BAT = 8,
    ROCKFORD = 9,
    EXIT_DOOR = 10,
    ICE_EMPTY = 11,
    ICE_DIRT = 12,
    ICE_BRICK_WALL = 13,
    BOMB = 14,
}

---@enum RECT
Enum_Data.RECT = {
    EMPTY = 1,
    DIRT = 2,
    BRICK_WALL = 3,
    STEEL_WALL = 4,
    GEAR = 5,
    TIME = 6,
    BOULDER = 7,
    DIAMOND = 8,
    ICE_DIRT = 9,
    ICE_BRICK_WALL = 10,
    ICE_EMPTY = 11,
}

---@enum SOUND
Enum_Data.SOUND = {
    LISTENER = 1,
    FILE_DATA = 2,
    SPRITE_STREAM_DATA = 3,
    SPRITE_FALL_STREAM_DATA = 4,
    --sprite_fall_stream_data
    --sprite_fall_position_data
    --sprite_fall_time_data
    --play_block
    -- DUG_DIRT = 1,
    -- PICKUP_DIAMOND = 2,
    -- EXPLOSION = 3,
    -- POWERUP = 4,
}

---@enum SPRITE_DATA
Enum_Data.SPRITE_DATA = {
    CURRENT_CELL = 1,
    MOVED_FLAG = 2,
    TARGET_CELL = 3,
    --current_cell
    --target_cell
--    MOVED_BUFFER = 5,
--    EXPLOSION_FLAG = 6,
}

---@enum SPRITE_CLASS_TYPE
Enum_Data.SPRITE_CLASS_TYPE = {
    SPRITE_2D = 1,
    ANIMATED_SPRITE_2D = 2,
}

---@enum CAVE_TYPE
Enum_Data.CAVE_TYPE = {
    CURRENT_STATE = 1,
    CAVE = 2,
    DIFFICULTY = 3,
    CURRENT_TIME = 4,
    MODULE_RESOURCE = 5,
    COUNTDOWN_TIME = 6,
    LOAD_FLAG = 7,
    PAUSE_FLAG = 8,
    SPRITE_QUERY_BLOCK = 9,
}

---@enum MODULE_RESOURCE
Enum_Data.MODULE_RESOURCE = {
    DIAMONDS_REQUIRED = 1,
    REMAINING_TIME = 2,
    GROUND_DATA = 3,
    OBJECT_DATA = 4,
}

---@enum SPRITE_TYPE
Enum_Data.SPRITE_TYPE = {
    SPRITE_TABLE = 1,
    SELF_DATA = 2, --for ROCKFORD ?
    SELF_SPRITE = 3, --for ROCKFORD ?
    TSCN_FILE = 4,
    LOAD_TSCN_FILE = 5,
    ACTION_TABLE = 6,
    DATA_TABLE = 7,
    ROCKFORD_MOVED_TABLE = 8,
}

---@enum ROCKFORD_MOVED_TYPE
Enum_Data.ROCKFORD_MOVED_TYPE = {
    LAST_MOVED = 1,
    MOVED_FLAG = 2,
}

---@enum ROCKFORD_COMMAND_MOVED_TYPE
Enum_Data.ROCKFORD_COMMAND_MOVED_TYPE = {
    MOVED_TYPE = 1,
--    COMMAND_MOVE_BUFFER = 2,
}

---@enum SPRITE_MANAGER_TYPE
Enum_Data.SPRITE_MANAGER_TYPE = {
    FRAME_OFFSET = 1,
    BLOCK_TO_SPRITE_FRAME_INDEX = 2,
    SPRITE_MOUDLE = 3,
    SPRITE_DATA = 4,
    SPRITE_CLASS_TYPE = 5,
    ENQUEUE_LIST = 6,
    ENQUEUE_BLOCK = 7,
    ENQUEUE_TILE_CELL = 8,
    ENQUEUE_SPAWN_BLOCK = 9,
}

---@enum TILE_CELL_TYPE
Enum_Data.TILE_CELL_TYPE = {
    LIST = 1,
    POSITION = 2,
}

---@enum COLLISION_TYPE
Enum_Data.COLLISION_TYPE = {
    ROCKFORD = 1,
    BOULDER = 2,
    DIAMOND = 3,
    CREATURE = 4,
    PUSH_BOULDER = 5,
}

---@enum BOMBER_TYPE
Enum_Data.BOMBER_TYPE = {
    CAN_BOMB_SPRITE = 1,
    BOULDER_BOMBED_SPRITE = 2,
    ROCKFORD_BOMBED_SPRITE = 3,
    BOMB_SQUARE_ADDED_LENGTH = 4,
    UNBOMB_BLOCK = 5,
    GAME_OVER_ACTION = 6,
}

---@enum CREATURE_MOVER_TYPE
Enum_Data.CREATURE_MOVER_TYPE = {
    CAN_MOVE_CREATURE = 1,
    CHECK_DIRECTION = 2,
}

---@enum CREATURE_SPRITE_TYPE
Enum_Data.CREATURE_SPRITE_TYPE = {
    LAST_DIRECTION = 1,
}

return Enum_Data

--res://lua/feature/action/draw/drawer.lua
local Enum_Data = require("lua.enum.enum_data")
local Main_Data = require("lua.feature.data.main")
local Rect_Data = require("lua.feature.data.draw.rect")
local Texture_Resource_Data = require("lua.feature.data.draw.texture_resource")
local Data = require("lua.feature.data.draw.drawer")
local World_Data = require("lua.world_layout.world_data")
local Game_Data = require("lua.feature.data.game.game")
--local Sprite_Manager = require("lua.feature.action.object.sprite.manager")

---@class Action.Drawer
local Drawer = {
}

function Drawer:draw()
    local module_resource = Game_Data[Enum_Data.CAVE_TYPE.MODULE_RESOURCE]
    if module_resource == nil or not Game_Data[Enum_Data.CAVE_TYPE.LOAD_FLAG] then
        return
    end
    ---@type Node2D
    local node2D = World_Data.node2D
    local block_size = Main_Data.BLOCK_SIZE
    local cave_data = module_resource[Enum_Data.MODULE_RESOURCE.GROUND_DATA]
    local cave_data_y = #cave_data
    local cave_data_x = #cave_data[1]
    local tileset_texture = Texture_Resource_Data.tileset_texture
    local block_to_rect = Rect_Data.block_to_rect
    local tileset = Rect_Data.tileset
    for y = 1, cave_data_y do
        local row = cave_data[y]
        for x = 1, cave_data_x do
            local begin_x = (x - 1) * block_size
            local begin_y = (y - 1) * block_size
            local index = row[x]
            local tile_index = block_to_rect[index]
            local tile = tileset[tile_index]
            node2D:draw_texture_rect_region(tileset_texture
                    , Rect2(begin_x, begin_y, block_size, block_size)
                    ,tile
                )
        end
    end
--    local draw_data = Data.data
-- --    Sprite_Manager:query()
--     for y = 1, cave_data_y do
--         local row = cave_data[y]
--         for x = 1, cave_data_x do
--             local begin_x = (x - 1) * block_size
--             local begin_y = (y - 1) * block_size
--             local index = row[x]
--             if type(index) ~= "number" then
--                 index = Enum_Data.BLOCK.EMPTY
--             elseif index == Enum_Data.BLOCK.STEEL_WALL
--                     or index == Enum_Data.BLOCK.EMPTY
--                     or index == Enum_Data.BLOCK.DIRT
--                     or index == Enum_Data.BLOCK.BRICK_WALL
--                     or index == Enum_Data.BLOCK.ICE_EMPTY
--                     or index == Enum_Data.BLOCK.ICE_BRICK_WALL
--                 then
--                 --?
--             else
--                 row[x] = Sprite_Manager:query(index, x, y)
-- --                print(string.format("%s, %s", "Sprite_Manager:query", tostring(row[x])))
--                 index = Enum_Data.BLOCK.EMPTY
--             end
--             local tile_index = block_to_rect[index] --draw_data[block_to_rect[index]]
--             local tile = tileset[tile_index]
--             node2D:draw_texture_rect_region(tileset_texture
--                     , Rect2(begin_x, begin_y, block_size, block_size)
--                     ,tile
--                 )
--         end
--     end
    --node2D:draw_texture_rect_region(tileset_texture
--                    ,Rect2(begin_x, begin_y, block_size, block_size)
--                    ,tile
--                )
    --data
end

return Drawer

--res://lua/feature/action/draw/texture_resource.lua
local Data = require("lua.feature.data.draw.texture_resource")
local Rect_Data = require("lua.feature.data.draw.rect")

---@class Action.Texture_Resource
local Texture_Resource = {
}

---@param rect RECT
---@return AtlasTexture
function Texture_Resource:queryAtlasTexture(rect)
    local atlas = AtlasTexture:new()
    atlas:set_atlas(Data.tileset_texture)
    local rectTexture = Rect_Data.tileset[rect]
    atlas:set_region(rectTexture)
    return atlas
end

return Texture_Resource


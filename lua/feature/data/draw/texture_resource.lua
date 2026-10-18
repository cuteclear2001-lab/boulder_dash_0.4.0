--res://lua/feature/data/draw/texture_resource.lua
local TILESET_PATH = "res://png/tileset.png"

---@class Data.Texture_Resource
---@field tileset_texture ResourceLoader
local Texture_Resource = {
    tileset_texture = ResourceLoader:load(TILESET_PATH),
}

return Texture_Resource

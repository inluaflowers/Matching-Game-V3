local Assets = {
}


local function remove_PNG_extension(filename)
  return filename:gsub("%.png$", "")
end

local function load_assets()
  local sprite_root = "Sprites"
  -- If there isn't a directory, print an error message
  if not love.filesystem.getInfo(sprite_root) then
    print("Sprite directory not found: " .. sprite_root)
    return
  end
  local categories = love.filesystem.getDirectoryItems(sprite_root)
  for _, category in ipairs(categories) do
    local category_path = sprite_root .. "/" .. category
    local category_info = love.filesystem.getInfo(category_path)
    print(category_info)
  end
end

load_assets()
return Assets

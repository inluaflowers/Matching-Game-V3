local T = require('tools')
local Assets = {}

-- Built in string:Match % maies . literal, $ looks at end of the string
local function check_for_PNG_ext(file_name)
  return file_name:match('%.png$')
end

local function remove_PNG_ext(file_name)
  return file_name:gsub("%.png$", "")
end

local function load_assets()
  -- Root Directory relative to main.lua
  local sprite_root = "Sprites"
  -- If there isn't a directory, print an error message
  if not love.filesystem.getInfo(sprite_root) then
    print("Sprite directory not found: " .. sprite_root)
    return
  end
  -- All sprite category subdirectories
  local categories = love.filesystem.getDirectoryItems(sprite_root)
  for _, category in ipairs(categories) do
    local category_path = sprite_root .. "/" .. category
    local category_info = love.filesystem.getInfo(category_path)
    -- Checks to make sure category info is not nil and that the type is a directory
    if category_info and category_info.type == 'directory'then
      Assets[category] = {}
      -- All files in current category directory
      local files = love.filesystem.getDirectoryItems(category_path)
      -- Used to print number of files loaded into assets by category
      local file_count = 0
      -- Will run the next loop so long as category directory isn't empty
      if T.has_items(files) then
        for _, file in ipairs(files) do
          file_count = file_count + 1
          if check_for_PNG_ext(file) then
            local file_path = category_path .. '/' .. file
            local sprite = love.graphics.newImage(file_path)
            local asset_name = remove_PNG_ext(file)

            Assets[category][asset_name] ={
              name = asset_name,
              sprite = sprite,
              width = sprite:getWidth(),
              height = sprite:getHeight()
            }
          end
        end
      print(file_count .. ' assests loaded from ' .. category)
      else
        print("No Files in", category_path)
      end
    end
  end
end

load_assets()
return Assets

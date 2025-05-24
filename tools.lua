local Tools = {}

function Tools.table_length(input_table)
  local count = 0
  for _ in pairs(input_table) do
    count = count + 1
  end
  return count
end

function Tools.has_items(input_table)
  return Tools.table_length(input_table) > 0
end

function Tools.is_table(obj)
  return type(obj) == "table"
end

function Tools.concat_tables(input_table_1, input_table_2)
  local result = {}
  for k, v in pairs(input_table_1) do
    result[k] = v
  end
  for k, v in pairs(input_table_2) do
    result[k] = v
  end
  return result
end

function Tools.print_table(input_table)
  if Tools.is_table(input_table) then
    print((input_table.__name or "No Name Given"))
    for k, v in pairs(input_table) do
      local subtable = nil
      if Tools.is_table(v) then
        subtable = 'Subtable ' .. v.__name or 'no name'
      end
      print(k, (subtable or v))
    end
  else
    print((table_name or "No Name Given") .. "is not a table")
  end
end

function Tools.look_for_subtables(input_table)
  local table_list = {}
  for k, v in pairs(input_table) do
    if Tools.is_table(v) then 
      table_list[k]
    end
  end
  return table_list
end

function Tools.remove_duplicates(input_table)
  local seen = {}
  local result = {}
  for k, v in ipairs(input_table) do
    if not seen[v] then
      table.insert(result, v)
      seen[v] = true
    end
  end
  return result
end

function Tools.remove_item(input_to_remove, input_table)
  local result = {}
  for k, v in pairs(input_table) do
    if v ~= input_to_remove then 
      table.insert(result, v)
    end
  end
  return result
end

function Tools.print_all_tables(input_table, table_name)
  
end


return Tools
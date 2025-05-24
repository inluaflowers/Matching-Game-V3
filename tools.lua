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

function Tools.print_table(input_table, table_name)
  if Tools.is_table(input_table) then
    print('Table Name:', (table_name or "No Name Given"))
    for k, v in pairs(input_table) do
      print(k, v)
    end
  else
    print((table_name or "No Name Given") .. "is not a table")
  end
end

return Tools
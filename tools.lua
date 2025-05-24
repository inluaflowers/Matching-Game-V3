local Tools = {}
Tools.__index =  Tools

function Tools:is_table(obj)
  return type(obj) == "table"
end

function Tools:print_table(input_table, table_name)
  if self:is_table(input_table) then
    print(table_name or "No Name Given")
    for k, v in pairs(input_table) do
      print(k, v)
    end
  else
    print((table_name or "No Name Given") .. "is not a table")
  end
end

return Tools
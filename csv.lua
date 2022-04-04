
--helper functions
local split = function(str, char)
  local lasti = 1
  local subs = {}
  for i = 1, #str, 1 do
    local c = str:sub(i,i)
    if (char == c) then 
      table.insert(subs, string.sub(str, lasti, i-1))
      lasti = i +1
    end
  end
  table.insert(subs, string.sub(str, lasti))
  return subs
end


-- expects tables of equal length
local function zip (t1, t2)
  local zipped = {}
  for k,v in pairs(t1) do
    zipped[v] = t2[k]
  end
  return zipped
end


----------------


-- parses, treating first line the same as other lines
local function parse(file)
  local tab = {}
  for line in file:lines() do
    table.insert(tab, split(line, ","))
  end
  return tab

end

--parses, treating the first line as table keys
local function parseh(file)
  local tab = {}
  local headers = split(file:read(), ",")
  for line in file:lines() do
    local values = split(line, ",")
    table.insert(tab, zip(headers, values))
  end
  return tab

end

return {
  split = split, --expose only for testing
  parse = parse,
  parseh = parseh
}
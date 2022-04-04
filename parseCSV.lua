--parses a csv file that lists out trades
--file format is
--inputItemName,inputAmount,outputItemName,outputAmount 
local tradeFile = io.open("tradelist.csv", "r")


local split = function(str, char)
  local lasti = 1
  local subs = {}
  for i = 1, #str, 1 do
    local c = str:sub(i,i)
    if (char ~= c) then goto continue
    else 
      table.insert(subs, string.sub(str, lasti, i-1))
      lasti = i +1
    end
    ::continue::
  end
  table.insert(subs, string.sub(str, lasti))
  return subs
end

local function parse(file)
  local tab = {}
  --separate line into itemname,quantity substrings
  for line in file:lines() do
    table.insert(tab, split(line, ","))
  end
  return tab

end

return {
  split = split,
  parse = parse
}
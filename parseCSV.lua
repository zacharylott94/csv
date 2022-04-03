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


-- local function parseItem (str)
--   local item = {}
--   item.name = string.match(str, "(%w+:%w+)")
--   item.count = string.match(str, "%d+")
--   return item
-- end

-- local function parse(line)
--   local trade = {}
--   --separate line into itemname,quantity substrings
--   for each in string.gmatch(line, "(%w+:%w+,%d+)") do
--     -- parse each substring into an Item table
--     local item = parseItem(each)
--     table.insert(trade, item)
--   end
--   return trade

-- end


-- local tradelist = {}
-- for line in tradeFile:lines() do
--   table.insert(tradelist, parse(line))
-- end
-- return tradelist

return split
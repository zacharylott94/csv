require("unit")


-- stolen from https://www.codegrepper.com/code-examples/lua/lua+table+pretty+print
local function dump(o)
  if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
              if type(k) ~= 'number' then k = '"'..k..'"' end
              s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
  else
      return tostring(o)
  end
end

local suite = Unit.suite("split",{

  Unit.test("will split a string", function() 
    local split = require("parseCSV")
    local actual = split("1,2,3", ",")
    local expected = {"1","2","3"}
    return Unit.deepEquals(expected, actual), dump(actual), dump(expected) 
  end)

})

Unit.report(suite)
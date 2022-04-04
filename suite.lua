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

local split = Unit.suite("split",{

  Unit.test("will split a string", function() 
    local split = require("parseCSV").split
    local actual = split("1,2,3", ",")
    local expected = {"1","2","3"}
    return Unit.deepEquals(expected, actual), dump(actual), dump(expected) 
  end)

})

local parse = Unit.suite("parse", {
  Unit.test("returns a table of tables", function() 
    local parse = require("parseCSV").parse
    local file = io.open("test.csv", "r")
    local actual = parse(file)
    local expected = {
      {"1","2","3"},
      {"a","b","c"}
    }
    local first = Unit.deepEquals(actual[1], expected[1])
    local second = Unit.deepEquals(actual[2], expected[2])
    return (first and second), dump(actual), dump(expected)
  
  end)
})

Unit.report(split)
Unit.report(parse)
require("unit")


local split = Unit.suite("split",{

  Unit.test("will split a string", function() 
    local split = require("csv").split
    local actual = split("1,2,3", ",")
    local expected = {"1","2","3"}
    return {
      Unit.deepEquals(expected, actual),
      Unit.deepEquals(split(",1,2,3", ","), {"","1","2","3"}),
      Unit.deepEquals(split(",1,2,3,", ","), {"","1","2","3",""}),
      Unit.deepEquals(split("1232425", "2"), {"1","3","4","5"}),

    }
  end)

})

local parse = Unit.suite("parse", {
  Unit.test("returns a table of tables", function() 
    local parse = require("csv").parse
    local file = io.open("test.csv", "r")
    local actual = parse(file)
    local expected = {
      {"a","b","c"},
      {"1","2","3"}
    }
    return {
      Unit.deepEquals(actual[1], expected[1]),
      Unit.deepEquals(actual[2], expected[2])
    }
  
  end)
})

local parseh = Unit.suite("parseh", {
  Unit.test("returns a table of tables where the inner tables have named fields", function() 
    local parseh = require("csv").parseh
    local file = io.open("test2.csv", "r")
    local actual1,actual2 = table.unpack(parseh(file))
    local expected1 = {a = 1,b = 2,c = 3,d = 4}
    local expected2 = {a = "w",b = "x",c = "y",d = "z"}
    return {
      Unit.deepEquals(actual1,expected1),
      Unit.deepEquals(actual2,expected2),

    }
  
  end)
})

local parsedict = Unit.suite("parse.dict", {
  Unit.test("returns a dictionary", function()
  local expected = {
    key = "value",
    item = "itemName"
  }
  local parsedict = require("csv").parsedict
  local file = io.open("dict.csv", "r")

  local actual = parsedict(file) 
  return {
    Unit.deepEquals(actual,expected)
  }
  end)
})

Unit.report(split)
Unit.report(parse)
Unit.report(parseh)
Unit.report(parsedict)
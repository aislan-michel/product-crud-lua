dofile("application/utils/printLines.lua")
local Command = {}

function Command:new()
  local obj = {}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Command:execute(products)
end

return Command

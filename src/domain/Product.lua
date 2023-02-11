dofile("domain/utils/isEmptyOrWhiteSpace.lua")
local uuid = require"domain.utils.uuid"

Product = {}
Product.__index = Product

function Product:new(name, price)
    local obj = {}
    setmetatable(obj, Product)
    obj.id = uuid.generate()
    obj.name = name
    obj.price = price
    obj.notifications = {}
    return obj
end

function Product:validate()
    if isEmptyOrWhiteSpace(self.name) then
        table.insert(self.notifications, "Name is invalid")
    end

    if tonumber(self.price) <= 0 then
        table.insert(self.notifications, "Price is invalid")
    end
end

function Product:isValid()
    if self.notifications == nil or #self.notifications <= 0 then
        return true
    end
    return false
end

function Product:toString()
    if Product:isValid() then
        return self.id .. " - " .. self.name .. " - $" .. tostring(self.price)
    end
    return ""
end

function Product:getId()
    return self.id
end

function Product:update(price)
    self.price = price
end

function Product:printNotifications()
    for i = 1, #self.notifications do
        print(self.notifications[i])
    end
end
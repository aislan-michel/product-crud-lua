Product = {}
Product.__index = Product

local random = math.random
local function uuid()
    local template = 'xxx'
    return string.gsub(template, '[xy]', function(c)
            local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
            return string.format('%x', v)
        end)
end

function Product:new(name, price)
    local obj = {}
    setmetatable(obj, Product)
    obj.id = uuid()
    obj.name = name
    obj.price = price
    obj.notifications = {}
    return obj
end

local function isEmptyOrWhiteSpace(s)
    return s == nil or s == '' or s == ' '
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

function Product:getNotifications()
    return self.notifications
end

function Product:getNotification(index)
    return self.notifications[index]
end

function Product:getId()
    return self.id
end

function Product:update(name, price)
    self.name = name
    self.price = price
end
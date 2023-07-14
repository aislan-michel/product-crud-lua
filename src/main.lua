dofile("domain/Product.lua")

local commandMap = {
    [1] = require("application.commands.CreateCommand"),
    [2] = require("application.commands.ReadCommand"),
    [3] = require("application.commands.UpdateCommand"),
    [4] = require("application.commands.DeleteCommand")
}

local products = {}
local option = nil
local selectedCommand = nil

print("Welcome! What do you want to do?")
print("1 - Create")
print("2 - Read")
print("3 - Update")
print("4 - Delete")
print("0 - Quit")
print("Type number of option: ")
option = tonumber(io.read())
selectedCommand = commandMap[option]

while option > 0 do
    if selectedCommand then
        selectedCommand:execute(products)
    else
        printLines()
        print("invalid option \n")
    end
    print("1 - Create")
    print("2 - Read")
    print("3 - Update")
    print("4 - Delete")
    print("0 - Quit")
    print("Type number of option: ")
    option = tonumber(io.read())
    selectedCommand = commandMap[option]
end

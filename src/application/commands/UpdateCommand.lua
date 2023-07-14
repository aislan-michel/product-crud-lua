local Command = require("application.commands.Command")

local UpdateCommand = Command:new()

function UpdateCommand:execute(products)
    printLines()
    print("Product Id")
    local id = io.read()

    local productToUpdate = nil
    local indexOfProductToUpdate = nil

    for i = 1, #products do
        if products[i]:getId() == id then
            productToUpdate = products[i]:toString()
            indexOfProductToUpdate = i
        end
    end

    printLines()

    if productToUpdate == nil then
        print("not found")
    else
        print(productToUpdate)

        print("New product price")
        local price = io.read()

        products[indexOfProductToUpdate]:update(price)
    end

    printLines(1)
end

return UpdateCommand

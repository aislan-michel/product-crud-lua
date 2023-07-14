local Command = require("application.commands.Command")

local DeleteCommand = Command:new()

function DeleteCommand:execute(products)
    printLines()
        print("Product Id")
        local id = io.read()

        local productToDelete = nil
        local indexOfProductToDelete = nil

        for i = 1, #products do
            if products[i]:getId() == id then
                productToDelete = products[i]:toString()
                indexOfProductToDelete = i
            end
        end

        printLines()

        if productToDelete == nil then
            print("not found")
        else
            table.remove(products, indexOfProductToDelete)

            print(productToDelete .. " - deleted with success")
        end

        printLines(1)
end

return DeleteCommand
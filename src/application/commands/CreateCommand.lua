local Command = require("application.commands.Command")

local CreateCommand = Command:new()

function CreateCommand:execute(products)
    printLines()
    print("Product name: ")
    local name = io.read()
    print("Product price: ")
    local price = io.read()
    local product = Product:new(name, price)
    product:validate()
    if product:isValid() then
        table.insert(products, product)
        printLines()
        print(product:toString() .. "\n")
    else
        printLines()
        product:printNotifications()
        printLines(1)
    end
end

return CreateCommand

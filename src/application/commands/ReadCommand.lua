local Command = require("application.commands.Command")

local ReadCommand = Command:new()

function ReadCommand:execute(products)
    printLines()
    if #products == 0 then
        print("you don't have any products")
    else
        print("Products: ")
        print("id - name - price\n")
        for i = 1, #products do
            print(products[i]:toString())
        end
    end
    printLines(1)
end

return ReadCommand

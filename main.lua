dofile("Product.lua");
dofile("PrintLines.lua")
dofile("Options.lua")

local products = {}
local option = nil

print("Welcome! What do you want to do?")
option = Options()

while option > 0 do
    if option == 1 then
        PrintLines()

        print("Product name: ")
        local name = io.read()

        print("Product price: ")
        local price = io.read()

        local product = Product:new(name, price)

        product:validate()

        if product:isValid() then
            table.insert(products, product)
            PrintLines()
            print(product:toString() .. "\n")
        else
            PrintLines()
            product:printNotifications()
            PrintLines(1)
        end
    elseif option == 2 then
        PrintLines()
        if #products == 0 then
            print("you don't have products")
        else
            print("Products: \n")
            for i = 1, #products do
                print(products[i]:toString())
            end
        end

        print("")
    elseif option == 3 then
        PrintLines()
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

        PrintLines()

        if productToUpdate == nil then
            print("not found")
        else
            print(productToUpdate)

            print("New product price")
            local price = io.read()

            products[indexOfProductToUpdate]:update(price)
        end

        PrintLines(1)
    elseif option == 4 then
        PrintLines()
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

        PrintLines()

        if productToDelete == nil then
            print("not found")
        else
            table.remove(products, indexOfProductToDelete)

            print(productToDelete .. " - deleted with success")
        end

        PrintLines(1)
    else
        PrintLines()
        print("invalid option")
    end

    option = Options()
end

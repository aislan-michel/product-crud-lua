dofile("Product.lua");

local function printLines(count)
    if count == nil then
        count = 25
    end

    for i = 1, count do
        print("")
    end
end

local products = {}
local option = nil
local function options()
    print("1 - Create")
    print("2 - Read")
    print("3 - Update")
    print("4 - Delete")
    print("0 - Quit")
    print("Type number of option: ")
end

print("Welcome! What do you want to do?")
options()
option = tonumber(io.read())

while option > 0 do
    if option == 1 then
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
            for i = 1, #product:getNotifications() do
                print(product:getNotification(i))
            end
            printLines(1)
        end
    elseif option == 2 then
        printLines()
        if #products == 0 then
            print("you don't have products\n")
        else
            print("Products: \n")
            for i = 1, #products do
                print(products[i]:toString())
            end
        end

        print("")
    elseif option == 3 then
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
            print("New product name")
            local name = io.read()

            print("New product price")
            local price = io.read()

            products[indexOfProductToUpdate]:update(name, price)
        end

        printLines(1)
    end

    options()
    option = tonumber(io.read())
end

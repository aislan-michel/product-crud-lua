local console = {}

function console:printProducts(products)
    print("Products: \n")
    for i = 1, #products do
        print(products[i]:toString())
    end
end

return console

local function isEmptyOrWhiteSpace(s)
    return s == nil or s == '' or s == ' '
end;

local function newProduct(name, price)
    local self = {name, price};

    local isValid = function (v)
                        if isEmptyOrWhiteSpace(name) then
                            print("Nome do produto inválido");
                            return;
                        end

                        print("O produto " .. name .. " custa R$" .. tostring(price));
                    end

    return {
        self = self,
        isValid = isValid
    }
end

local products = {};
local option = nil;

print("Welcome! What do you want to do?");
print("1 - Create");
print("2 - Read");
print("3 - Update");
print("4 - Delete");
print("0 - Quit");
print("Type number of option: ");
option = tonumber(io.read());

while option > 0 do
    if option == 1 then
        local name = "";
        print("Product name: ");
        name = io.read();

        local price = 0.0;
        print("Product price: ");
        price = io.read();

        local product = newProduct(name, price);

        product.isValid();

        products[0] = product;
    elseif option == 2 then
        for i=1, 5 do
            print(products[i])
        end
    end

    print("\n1 - Create");
    print("2 - Read");
    print("3 - Update");
    print("4 - Delete");
    print("0 - Quit");
    print("Type number of option: ");
    option = tonumber(io.read());
end



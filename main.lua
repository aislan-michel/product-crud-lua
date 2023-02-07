local function isEmptyOrWhiteSpace(s)
    return s == nil or s == '' or s == ' ';
end

local function options()
    print("1 - Create");
    print("2 - Read");
    print("3 - Update");
    print("4 - Delete");
    print("0 - Quit");
    print("Type number of option: ");
end

local function newProduct(name, price)
    local self = { name, price };

    local validation = {
        messages = {},
        validate = function()
            if isEmptyOrWhiteSpace(name) then
                messages[1] = "Name is invalid";
            end
        end,
        isValid = function()
            if messages == nil or #messages <= 0 then
                return true;
            end
            return false;
        end
    }

    local toString = function ()
                        if validation.isValid() then
                            return  "Product " .. name .. " cost $" .. tostring(price);
                        end
                        return "";
                     end

    return {
        self = self,
        validation = validation,
        toString = toString
    }
end

local products = {};
local option = nil;

print("Welcome! What do you want to do?");
options();
option = tonumber(io.read());

while option > 0 do
    if option == 1 then
        print("Product name: ");
        local name = io.read();

        local price = 0.0;
        print("Product price: ");
        price = io.read();

        local product = newProduct(name, price);

        product.validation.validate();

        if product.validation.isValid() then
            table.insert(products, product);
        else
            for i = 1, #product.validation.messages do
                print(product.validation.messages[i]);
            end
        end
    elseif option == 2 then
        if #products == 0 then
            print("you don't have products");
        else
            print("Products: \n")
            for i = 1, #products do
                print(products[i].toString())
            end
        end
    end

    options();
    option = tonumber(io.read());
end

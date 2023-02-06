local id = "";
local name = "";
local price = 0.0;

print("Nome do produto: ");
name = io.read();

print("Valor do produto: ");
price = io.read();

print("O produto " .. name .. " custa R$" .. tostring(price));
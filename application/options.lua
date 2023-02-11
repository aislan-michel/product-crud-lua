local options = {}

function options.printOptions()
    print("1 - Create")
    print("2 - Read")
    print("3 - Update")
    print("4 - Delete")
    print("0 - Quit")
    print("Type number of option: ")
end

function options.getOption()
    return tonumber(io.read())
end

return options


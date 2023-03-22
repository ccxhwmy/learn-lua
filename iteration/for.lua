local config = {
    "a", "b", "c"
}

local index = 0
for _, v in pairs(config) do
    print("val: ", v)
end

for i = 1, 2 do
    print("i: ", i)
end

local index = 0
for i = 1, 10 do
    index = index + i
end
print(index)
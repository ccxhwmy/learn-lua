local b = {}
table.insert(b, "aaaaa")
table.insert(b, "bbbbb")

local t = {}
t["b"] = b
t["a"] = b
t["c"] = b

print(next(t))
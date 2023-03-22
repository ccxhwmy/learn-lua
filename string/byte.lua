-- local str = "0123456789ABCDEFGHIJKLMNOPQISTUVWXYZabcdefghijklmnopqistuvwxyz.-"

-- for i = 1, #str do
--     print(string.byte(str, i))
-- end

-- local t = {98,99,100}
-- for i = 1, #t do
--     t[i] = string.char(t[i])
-- end
-- print(table.concat(t, ""))


local remote_addr = "10.255.255.255"
print(string.char(string.byte(remote_addr, 1, 6)))
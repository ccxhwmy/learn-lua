local function check_hex(str)
    for i = 1, #str do
        local ord = str:byte(i)
        if not ((48 <= ord and ord <= 57) or (65 <= ord and ord <= 70) or
            (97 <= ord and ord <= 102)) then return false end
    end
    return true
end

local function string_to_hex(str)
    t = {}
    if type(str) ~= "string" then return "input must be string", nil end

    if #str == 0 then return "input length is 0", nil end

    for i = 1, #str do
        table.insert(t, string.format("%02X", string.byte(str, i)))
    end
    return nil, table.concat(t, "")
end

local function hex_to_string(hex)
    local t = {}
    local h = ""

    if type(hex) ~= "string" then return "Input data must be string", nil end

    if #hex == 0 then return "Input data length must be greater than 0", nil end

    if #hex % 2 ~= 0 then
        return "The input data length must be an even number", nil
    end

    if check_hex(hex) == false then return "Input data invalid", nil end

    for i = 1, #hex, 2 do
        h = string.format("0x%s", string.sub(hex, i, i + 1))
        table.insert(t, string.char(h))
    end
    return nil, table.concat(t, "")
end

local input = "www.qq.com"
-- local input = "000"
print(input)
local err, res = string_to_hex(input)
if err ~= nil then
    print(err)
    return
end

print(res)
res = "717a2e717a6f6e652e71712e636f6d"
err, res = hex_to_string(res)
if err ~= nil then
    print(err)
    return
end
print(res)
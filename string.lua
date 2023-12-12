local function test_byte()
    local str = "0123456789ABCDEFGHIJKLMNOPQISTUVWXYZabcdefghijklmnopqistuvwxyz.-"

    for i = 1, #str do
        print(string.byte(str, i))
    end

    local t = { 98, 99, 100 }
    for i = 1, #t do
        t[i] = string.char(t[i])
    end
    print(table.concat(t, ""))

    local remote_addr = "10.255.255.255"
    print(string.char(string.byte(remote_addr, 1, 6)))
end

local function compare()
    local a = "hahah"
    local b = "hahah"

    print(a == b)
end

local function format()
    -- 打印字符串
    local retstr = string.format("\ntoday is %s", os.date())
    print(retstr)

    -- 打印数字
    retstr = string.format("\nmy age is %d", 22)
    print(retstr)

    -- 使用科学计数法表示
    retstr = string.format("\nthe number 1024 = %e", 1024)
    print(retstr)

    -- 无符号数字-1==4294967295
    retstr = string.format("\nthe unsigned number is %u", -1)
    print(retstr)

    -- 有符号数字-1
    retstr = string.format("\nthe number is %d", -1)
    print(retstr)

    -- 常规字符串
    retstr = string.format("\nthe content1 is %s", 
        "content1 is haha\n\0content1 second line")
    print(retstr)

    -- 特殊字符串
    retstr = string.format("\nthe content1 is %q", 
        "content2 is haha\n\0content2 second line")
    print(retstr)
end

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

local function hex()
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
end

local function match()
    local sourcestr = "ehre99wj=--=-*-/4mdqwl\0ds123fef"
    print("\nsourcestr = "..sourcestr)

    local match_ret = string.match(sourcestr, "%d%d%d")
    print("\nmatch_ret is "..match_ret)

    match_ret = string.match(sourcestr, "%d%a%a")
    print("\nmatch_ret is "..match_ret)

    match_ret = string.match(sourcestr, "")
    print("\nmatch_ret is "..match_ret)

    match_ret = string.match(sourcestr, "%d%d")
    print("\nmatch_ret is "..match_ret)

    match_ret = string.match(sourcestr, "%d%d", 10)
    print("\nmatch_ret is "..match_ret)
end

local function sub()
    -- 显示源字符串
    local sourcestr = "prefix--de asdsdjjj\0dsfdf56\0mfa54--suffix"
    print("\nsourcestr is", string.format("%q", sourcestr))

    local first_sub = string.sub(sourcestr, 4)
    print("\nfirst_sub is", string.format("%q", first_sub))

    sourcestr = "123"
    print(sourcestr, ": ", #string.sub(sourcestr, 2, 7))
end

-- test_byte()
-- compare()
-- format()
-- hex()
-- match()
sub()
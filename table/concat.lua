local urls = {"www.baidu.com"}
local protect_urls = table.concat(urls, "\n")
print("protecturls =", protect_urls)

local function test_concat()
    local t
    local res = table.concat({t, "hahaha"}, "&")
    print(res)
end

local function test_concat_nil()
    print(table.concat({"", "user_urle"}, "_"))
    print(table.concat({80, "user_urle"}, "_"))
end

test_concat_nil()

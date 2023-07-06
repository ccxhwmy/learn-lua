-- local var = "text/html"
-- local a = {}

-- a["Content-Type"] = var
-- -- table.insert(a, "Content-Type", var)

-- local b = {"haha", "hehe", "666"}

-- table.insert(a, "hello")

-- table.insert(a, b)

-- print(a["Content-Type"])
-- local tab_new = require "table.new"
-- local tbobj = tab_new(128, 0)

-- local dkjson = require "dkjson"
-- table.insert(tbobj, 1)
-- print(dkjson.encode(tbobj))

local dkjson = require "dkjson"
-- local a = {"111", "222", "333"}
-- local b = {"haha", "hehe", "666"}

-- table.insert(a, 1, 8182)
-- print("a: ", dkjson.encode(a))

local function table_insert_01()
    local tb_tmp = {}
    tb_tmp[#tb_tmp+1] = "a"
    tb_tmp[#tb_tmp+1] = "b"
    tb_tmp[#tb_tmp+1] = "c"

    print("a: ", dkjson.encode(tb_tmp))
end

table_insert_01()

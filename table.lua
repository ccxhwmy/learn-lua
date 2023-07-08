local dkjson = require "dkjson"

local tb_array = {
    1, 2, 3, 4, 5, 6
}

local function change_val()
    for i = 1, #tb_array do
        tb_array[i] = 2
    end

    print(unpack(tb_array))
end

local function concat()
    print(table.concat({ "www.baidu.com" }, "\n"))
    print(table.concat({ "", "user_rule" }, "_"))
    print(table.concat({ 80, "user_rule" }, "_"))
end


local function insert()
    tb_array[#tb_array + 1] = "a"
    tb_array[#tb_array + 1] = "b"
    tb_array[#tb_array + 1] = "c"

    print(unpack(tb_array))
end


local function key_with_dot()
    local tb_tmp = {
        ["aaa.bbb.ccc"]="ddd.eee.fff"
    }
    -- unpack can not pack, must use dkjson
    print(unpack(tb_tmp))
    print(dkjson.encode(tb_tmp))
end

local function cal_tb_len()
    local tb_tmp = {
        a = 1,
        b = 2,
        c = 3
    }
    print(table.getn(tb_tmp))  -- 0
end

local function test_next()
    local tb_tmp_child = {
        "a", "b"
    }

    local tb_tmp_parent = {}

    tb_tmp_parent["b"] = tb_tmp_child
    tb_tmp_parent["a"] = tb_tmp_child
    tb_tmp_parent["c"] = tb_tmp_child

    print(next(tb_tmp_parent))

    tb_tmp_parent = {
        ["b"] = tb_tmp_child,
        ["a"] = tb_tmp_child,
        ["c"] = tb_tmp_child
    }

    print(next(tb_tmp_parent))
end

local function str2tbl()
    local tb_str = [[{"pr_id":2,"real_server":{"server_list":[{"server_type":"http","server_name":"10.1.8.2","server_id":2,"port":80,"ip_addr":"10.1.8.2"}],"group_name_id":0,"group_name":"-"},"xff":false,"name":"test","caps":{},"feature_rule":{"name":"test","signature_rule":[{"action":"block","class_id":"10"},{"action":"block","class_id":"11"},{"action":"block","class_id":"12"},{"action":"block","class_id":"13"},{"action":"block","class_id":"14"},{"action":"block","class_id":"15"},{"action":"block","class_id":"16"},{"action":"block","class_id":"17"},{"action":"block","class_id":"18"},{"action":"block","class_id":"19"},{"action":"block","class_id":"20"},{"action":"block","class_id":"21"},{"action":"block","class_id":"22"},{"action":"block","class_id":"23"},{"action":"block","class_id":"24"},{"action":"block","class_id":"26"},{"action":"block","class_id":"27"},{"action":"block","class_id":"01"},{"action":"block","class_id":"02"},{"action":"block","class_id":"03"},{"action":"block","class_id":"04"},{"action":"block","class_id":"05"},{"action":"block","class_id":"06"},{"action":"block","class_id":"07"},{"action":"block","class_id":"08"},{"action":"block","class_id":"09"}]}}]]

    local tb_tmp = dkjson.decode(tb_str)
    if type(tb_tmp) == "table" then
        print(tb_tmp["pr_id"])
    end
end

-- change_val()
-- concat()
-- insert()
-- key_with_dot()
-- cal_tb_len()
-- test_next()
str2tbl()
local dkjson = require "dkjson"
local new_tab = require "table.new"

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
        ["aaa.bbb.ccc"] = "ddd.eee.fff"
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
    print(table.getn(tb_tmp)) -- 0
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
    local tb_str =
    [[{"pr_id":2,"real_server":{"server_list":[{"server_type":"http","server_name":"10.1.8.2","server_id":2,"port":80,"ip_addr":"10.1.8.2"}],"group_name_id":0,"group_name":"-"},"xff":false,"name":"test","caps":{},"feature_rule":{"name":"test","signature_rule":[{"action":"block","class_id":"10"},{"action":"block","class_id":"11"},{"action":"block","class_id":"12"},{"action":"block","class_id":"13"},{"action":"block","class_id":"14"},{"action":"block","class_id":"15"},{"action":"block","class_id":"16"},{"action":"block","class_id":"17"},{"action":"block","class_id":"18"},{"action":"block","class_id":"19"},{"action":"block","class_id":"20"},{"action":"block","class_id":"21"},{"action":"block","class_id":"22"},{"action":"block","class_id":"23"},{"action":"block","class_id":"24"},{"action":"block","class_id":"26"},{"action":"block","class_id":"27"},{"action":"block","class_id":"01"},{"action":"block","class_id":"02"},{"action":"block","class_id":"03"},{"action":"block","class_id":"04"},{"action":"block","class_id":"05"},{"action":"block","class_id":"06"},{"action":"block","class_id":"07"},{"action":"block","class_id":"08"},{"action":"block","class_id":"09"}]}}]]

    local tb_tmp = dkjson.decode(tb_str)
    if type(tb_tmp) == "table" then
        print(tb_tmp["pr_id"])
    end
end

local function insert_tail(tab, ...)
    local idx = #tab
    for i = 1, select('#', ...) do
        idx = idx + 1
        tab[idx] = select(i, ...)
    end

    return idx
end

local function test_insert_tail()
    print(insert_tail({ 1, 2, 3 }, 4, 5))
end

local function test_nkeys()
    local nkeys  = require "table.nkeys"
    local tb_tmp = {
        1,
        "2",
        ["3"] = 4,
        ["a"] = "b",
        5
    }

    print(nkeys(tb_tmp))
end

local function test_pairs()
    local tb_tmp = {
        1,
        "2",
        ["3"] = 4,
        ["a"] = "b",
        5
    }

    for k, v in pairs(tb_tmp) do
        print("k: ", k, ", v: ", v)
    end
end

local deepcopy
do
    local function _deepcopy(orig, copied)
        -- prevent infinite loop when a field refers its parent
        copied[orig] = true
        -- If the array-like table contains nil in the middle,
        -- the len might be smaller than the expected.
        -- But it doesn't affect the correctness.
        local len = #orig
        local copy = require("table.new")(len, require("table.nkeys")(orig) - len)
        for orig_key, orig_value in pairs(orig) do
            if type(orig_value) == "table" and not copied[orig_value] then
                copy[orig_key] = _deepcopy(orig_value, copied)
            else
                copy[orig_key] = orig_value
            end
        end

        local mt = getmetatable(orig)
        if mt ~= nil then
            setmetatable(copy, mt)
        end

        return copy
    end


    local copied_recorder = {}

    function deepcopy(orig)
        local orig_type = type(orig)
        if orig_type ~= 'table' then
            return orig
        end

        local res = _deepcopy(orig, copied_recorder)
        require("table.clear")(copied_recorder)
        return res
    end
end

local function test_deepcopy()
    local tb_tmp = {
        1,
        "2",
        ["3"] = 4,
        ["a"] = "b",
        5
    }
    print(unpack(tb_tmp))
    print(dkjson.encode(deepcopy(tb_tmp)))
    print(unpack(deepcopy(tb_tmp)))

    for i, v in pairs(tb_tmp) do
        print("i: ", i, ", type(i): ", type(i), ", v: ", v)
    end

    local tb_new = new_tab(3, 2)
    tb_new[1] = 1
    tb_new[2] = 2
    tb_new["a"] = "a"
    tb_new["b"] = "b"
    tb_new[3] = 3
    for i, v in pairs(tb_new) do
        print("i: ", i, ", type(i): ", type(i), ", v: ", v)
    end

    print(unpack(tb_new))
end

local function merge(origin, extend)
    for k,v in pairs(extend) do
        if type(v) == "table" then
            print(unpack(v))
            print(type(k))
            if type(origin[k] or false) == "table" then
                if require("table.nkeys")(origin[k]) ~= #origin[k] then
                    merge(origin[k] or {}, extend[k] or {})
                else
                    origin[k] = v
                end
            else
                origin[k] = v
            end
        elseif v == nil then
            origin[k] = nil
        else
            origin[k] = v
        end
    end

    return origin
end

local function test_merge()
    local a = {1, 2, 3}
    local b = {3, 3, 3}
    local d = {4, 5, 6}
    local tb_tmp_01 = {
        a = b,
        ["c"] = d,
        1,
        2,
        3
    }

    local tb_tmp_02 = {
        a = b,
        7, 8, 9
    }
    local tb_tmp_03 = {
        6, 6, 6
    }

    tb_tmp_02[tb_tmp_03] = {7, 7, 7}
    tb_tmp_01[tb_tmp_03] = {8, 8, 8}

    for k, v in pairs(merge(tb_tmp_01, tb_tmp_02)) do
        print("k: ", type(k), ", v: ", dkjson.encode(v))
    end
end


-- change_val()
-- concat()
-- insert()
-- key_with_dot()
-- cal_tb_len()
-- test_next()
-- str2tbl()
-- test_insert_tail()
test_nkeys()
-- test_pairs()
-- test_deepcopy()
-- test_merge()
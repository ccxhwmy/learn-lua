
local tb_str = [[{"pr_id":2,"real_server":{"server_list":[{"server_type":"http","server_name":"10.1.8.2","server_id":2,"port":80,"ip_addr":"10.1.8.2"}],"group_name_id":0,"group_name":"-"},"xff":false,"name":"test","caps":{},"feature_rule":{"name":"test","signature_rule":[{"action":"block","class_id":"10"},{"action":"block","class_id":"11"},{"action":"block","class_id":"12"},{"action":"block","class_id":"13"},{"action":"block","class_id":"14"},{"action":"block","class_id":"15"},{"action":"block","class_id":"16"},{"action":"block","class_id":"17"},{"action":"block","class_id":"18"},{"action":"block","class_id":"19"},{"action":"block","class_id":"20"},{"action":"block","class_id":"21"},{"action":"block","class_id":"22"},{"action":"block","class_id":"23"},{"action":"block","class_id":"24"},{"action":"block","class_id":"26"},{"action":"block","class_id":"27"},{"action":"block","class_id":"01"},{"action":"block","class_id":"02"},{"action":"block","class_id":"03"},{"action":"block","class_id":"04"},{"action":"block","class_id":"05"},{"action":"block","class_id":"06"},{"action":"block","class_id":"07"},{"action":"block","class_id":"08"},{"action":"block","class_id":"09"}]}}]]

local dkjson = require "dkjson"

local tb_tmp = dkjson.decode(tb_str)
if type(tb_tmp) == "table" then
    print(tb_tmp["pr_id"])
end



package.path = '/usr/local/share/lua/5.1/?.lua;./?.lua;'
package.cpath = '/usr/local/lib/lua/5.1/?.so;'

local uap = require('uap')
local dkjson = require "dkjson"

local tb_user_agent = {
    "Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)",
    "User-Agent, UCWEB7.0.2.37/28/999",
    "User-Agent, Openwave/ UCWEB7.0.2.37/28/999",
    "User-Agent,Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5",
    "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60",
    "curl/7.29.0"
}

for _, v in ipairs(tb_user_agent) do
    local user_agent = uap.parse(v)
    print("========================== v: ", v, "=========================")
    print(dkjson.encode(user_agent))
end


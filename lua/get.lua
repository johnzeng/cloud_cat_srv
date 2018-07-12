local mysql = require "resty.mysql"
local cjson = require "cjson"

local json_str = '{"name":"gogo"}'

local json = {pic = 'https://cloud-cat-1257030124.cos.ap-guangzhou.myqcloud.com/5.JPG', motto = "就是个测试，你紧张什么"}
ngx.say(cjson.encode(json))


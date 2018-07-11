local mysql = require "resty.mysql"
local cjson = require "cjson"

local args = ngx.req.get_uri_args()
for k,v in pairs(args) do
    ngx.say("[get] key:", k, ",v:",v)
end
ngx.say(args.a + args.b)
local json_str = '{"name":"gogo"}'
local json = cjson.decode(json_str)
local db = mysql:new()
local ok, err, errcode, sqlstate = db:connect({
        host = "172.16.161.3",
        port = 3306,
        database = "test",
        user = "root",
        password = "zengda"})
if err then
    ngx.say(err, ",", errorcode, ",", sqlstate)
end

local res, err, errcode, sqlstate = db:query("select * from cats")

if res then
	ngx.say(cjson.encode(res))
end

ngx.say(cjson.encode(json))


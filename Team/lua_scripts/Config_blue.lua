function FileRead()
	local file = io.open("./lua_scripts/config_blue.json", "r")
	local json = file:read("*a")
	file:close()
	return json;
end

local cjson = require("json")
local file = FileRead()
json = cjson.decode(file)

for a,b in pairs(json) do
    print("key:"..a)
	if(type(b) == "table") and b ~= nil then
		for m,n in pairs(b) do
			print("val:"..n)
		end
	else
		print("val:")
		if b == nil then
			print("val: nil");
		else
			print(b)
		end
		
	end
end
for	role,id
 in pairs(json.gRoleFixNum)do
		CRegisterRole(role, id - 1)
end

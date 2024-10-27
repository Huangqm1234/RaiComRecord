function shoot(task)
cpp_door = function()
	local role_name
	local _isKick
	local _power
	if task.role_name ~=nil then
		role_name = task.role_name
	else
		print("shoot no role name")
	end
	if isKick ~= nil then
	    _isKick = isKick
	else
	    print("chip ball")
	end
	if power ~= nil then
	    _power = power
	else
	    print("Default power")
	end
	
	CShoot(role_name, _isKick, _power)
end
	return cpp_door
end
gSkillTable.CreateSkill{
	name = "shoot",
}
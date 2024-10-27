function stop(task)
	cpp_door = function()
	local role_name
	local role
	if task.exc_role ~=nil then
		role_name = task.exc_role
	else
		print(" stop no role name")
	end
	if task.role ~=nil then
		role = task.role
		--print("role" ..role)
	else
		print("stop no role num")
	end
	CRobotStop(role_name,role)
	end	
	return cpp_door
end
gSkillTable.CreateSkill{
	name = "stop"
}
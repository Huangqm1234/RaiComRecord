function goreceivepos(task)
cpp_door = function()
	print("coming go receive")
	local role_name
	if task.role_name ~=nil then
		role_name = task.role_name
	else
		print(" goreceivepos no role name")
	end
	CGoReceivePos(role_name)
end
	return cpp_door
end
gSkillTable.CreateSkill{
	name = "goreceivepos"
}
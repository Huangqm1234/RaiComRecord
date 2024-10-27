function receiveball(task)
cpp_door = function()
	local role_name
	if task.role_name ~=nil then
		role_name = task.role_name
	else
		print(" receiveball no role name")
	end
	CReceiveBall(role_name)
end
	return cpp_door
end
gSkillTable.CreateSkill{
	name = "receiveball",
}
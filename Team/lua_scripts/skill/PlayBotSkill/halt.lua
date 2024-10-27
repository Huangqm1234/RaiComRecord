function halt(task)
cpp_door = function()
	local role_name
	if task.role_name ~=nil then
		role_name = task.role_name
	else
		print(" halt no role name")
	end
	CHalt(role_name)
end
	return cpp_door
end
gSkillTable.CreateSkill{
	name = "halt",
}
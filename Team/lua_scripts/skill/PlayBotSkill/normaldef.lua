function normaldef(task)
cpp_door = function()
	local role_name
	if task.role_name ~=nil then
		role_name = task.role_name
	else
		print(" normaldef no role name")
	end
	CNormalDef(role_name)
	end
return cpp_door
end
gSkillTable.CreateSkill{
	name = "normaldef",
}
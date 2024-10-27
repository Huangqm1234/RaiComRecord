function penaltykick(task)
	local role
	cpp_door = function()
	if task.role ~= nil then
		role = task.role
		CPenaltyKick(role)
	else
		print("penaltykick no role")
	end
	end
	return cpp_door
end
gSkillTable.CreateSkill{
	name = "penaltykick"
}
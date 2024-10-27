function passball(task)
cpp_door = function()
	local role_name
	local receive
	if task.runner_role ~= nil then
		role_name = task.runner_role
	else
		print(" passball no role name")
	end
	if task.receive ~= nil then
		receive = task.receive
	else
		receive = role_name
	end
	CPassBall(role_name,receive)
end
	return cpp_door
end

gSkillTable.CreateSkill{
	name = "passball",
}
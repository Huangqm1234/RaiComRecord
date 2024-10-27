function getball(task)
	cpp_door = function()
		local role_name
		local receive
		if task.role ~=nil then
			role_name = task.role
		else
			print(" get ball no role name")
		end
		if task.rec ~=nil then
			receive = task.rec
		else
			receive = role
		end
		if role_name ~=nil and  receive ~=nil then
			CGetBall(role_name,receive)
		else
			print("getball skill variable have nil value")
		end
	end	
	return cpp_door
end
gSkillTable.CreateSkill{
	name = "getball"
}
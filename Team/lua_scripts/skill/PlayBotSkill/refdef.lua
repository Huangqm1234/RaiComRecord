function refdef(task)
	cpp_door = function()
	local role
	if(task.role ~= nil ) then
		role = task.role
		CRefDef(role)
	else
		print("no set ref def role")
	end
	end
	return cpp_door
end


gSkillTable.CreateSkill{
	name = "refdef"
}
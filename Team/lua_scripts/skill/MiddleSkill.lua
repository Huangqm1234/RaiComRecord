function MiddleSkill(task)
cpp_door = function()
	local name
	local posX
	local posY
	local dir
	local kickflat
	local kp
	local cp
	if task.name ~= nil then
		name = task.name
	else
		print("no skill name")
	end
	if task.pos_x ~= nil then
		posX = task.pos_x
	else
		posX = 0
	end
	if task.pos_y ~= nil then
	    posY = task.pos_y
	else
	   posY = 0
	end
	if task.dir ~= nil then
		dir = task.dir
	else
		print("no dir")
	end
	if task.kickflat ~=nil then
		kickflat = task.kickflat
	else
		kickflat = false
	end
	if task.kp ~= nil then
		kp = task.kp
	else
		kp = 127
	end
	if task.cp ~=nil then
		cp = task.cp
	else
		cp = 6
	end
	CMiddle_Skill(name, posX, posY, dir, kickflat, kp, cp)
	end
	return cpp_door
end

gSkillTable.CreateSkill{
	name = "MiddleSkill"
}
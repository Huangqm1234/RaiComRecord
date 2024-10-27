function KickerSkill(task)
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
		--print("no skill name")
	end
	if task.pos_x ~= nil then
		posX = task.pos_x
		--print("*********posX:"..posX)
	else
		posX = 0
		--print("*********pos is 0")
	end
	if task.pos_y ~= nil then
	    posY = task.pos_y
		--print("*********posY:"..posY)
	else
	   posY = 0
	   --print("*********pos is 0")
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
	CKicker_Skill(name, posX, posY, dir, kickflat, kp, cp)
	end
    return cpp_door	
end

gSkillTable.CreateSkill{
	name = "KickerSkill"
}
function getoppnums(task)
cpp_door = function()
	local role_name
	local x;
	local y;
	local dir;
	if task.role_name ~=nil then
		role_name = task.role_name
	else
		print(" gotopos no role name")
	end
	if task.x ~=nil then
		if type(task.x) == "function" then
			x = task.x()
		else
			x = task.x
		end
	else
		print(" no x value")
	end
	
	if task.y ~=nil then
		if type(task.y) == "function" then
			y = task.y()
		else
			y = task.y
		end
	else
		print(" no y value")
	end
	
	if task.dir ~=nil then
		if type(task.dir) == "function" then
			dir = task.dir()
		else
			dir = task.dir
		end
	else
		print(" no x value")
	end
	print("*************************************************")
	CGetOppNums()
end
	return cpp_door
end
gSkillTable.CreateSkill{
	name = "getoppnums"
}
--desc: 
local Kickerdir2Balldir = function()
	return CRole2BallDir("Kicker")
end
gPlayTable.CreatePlay{
firstState = "GetBall",

["GetBall"] = {
	switch = function()
		if CBall2RoleDist("Receiver") < 30 then
			return "PassBall"
		end
	end,
	Kicker = task.GotoPos("Kicker", 180,0,Kickerdir2Balldir),
	--Kicker = task.GotoPos("Kicker", 75,0,Kickerdir2Balldir),
	Receiver = task.GetBall("Receiver","Receiver"),
	Goalie   = task.Goalie()
},
	
["PassBall"] = {
	switch = function()
		if CIsBallKick("Receiver") then
			return "Shoot"
		end
	end,
	Kicker = task.GotoPos("Kicker", 180,0,Kickerdir2Balldir),
	--Kicker = task.GotoPos("Kicker", 75,0,Kickerdir2Balldir),
	Receiver = task.PassBall("Receiver", "Kicker"),
	Goalie   = task.Goalie()
},

["Shoot"] = {
	switch = function()
		if CIsBallKick("Kicker") then
			return "finish"
		end
	end,
	Kicker = task.KickerTask("myshoot15"),
	Receiver = task.RefDef("Receiver"),
	Goalie = task.Goalie()
},
name = "mideasy2"
}
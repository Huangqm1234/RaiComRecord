local Kickerdir2Balldir = function()
	return CRole2BallDir("Kicker")
end

gPlayTable.CreatePlay{
firstState = "Start",

["Start"] = {
	switch = function()
		if CRole2TargetDist("Kicker")<10 and Cbuf_cnt(true,30) then
			return "PassBall"
		end
	end,
	Kicker   = task.GotoPos("Kicker",180,0,Kickerdir2Balldir),
	Receiver = task.RobotHalt("Receiver"),
	Goalie   = task.Goalie()
},

["PassBall"] = {
	switch = function()
		if CIsBallKick("Receiver") then
			return "Receive"
		end
	end,
	Kicker   = task.GotoPos("Kicker",180,0,Kickerdir2Balldir),
	Receiver = task.ReceiverTask("mypassballpower30"),
	Goalie   = task.Goalie()
},

["Receive"] = {
	switch = function()
		if  CBall2RoleDist("Kicker") < 50 and Cbuf_cnt(true,60) then
			return "Shoot"
		end
	end,
	Kicker = task.KickerTask("myreceiver"),
	Receiver = task.GotoPos("Receiver",-100,0,0),
	Goalie   = task.Goalie()
},

["Shoot"] = {
	switch = function()
		if CIsBallKick("Kicker")  then
			return "Finish"
		end
	end,
	Kicker  = task.KickerTask("myshoot"),
	Receiver = task.RobotHalt("Receiver"),
	Goalie = task.Goalie()
},

["Finish"] ={
	switch = function()
		if Cbuf_cnt(true,60) then
			return "Finish"
		end
	end,
	Kicker  = task.RobotHalt("Kicker"),
	Receiver = task.RobotHalt("Receiver"),
	Goalie = task.Goalie()
	
},
name = "backkick"
}
--desc: 

--desc: 
local Kickerdir2Balldir = function()
	return CRole2BallDir("Kicker")
end

gPlayTable.CreatePlay{
firstState = "Start",

["Start"] = {
	switch = function()
		if CRole2TargetDist("Receiver")<10 and Cbuf_cnt(true, 60) then
			return "GetBall"
		end
	end,
	Kicker   = task.GotoPos("Kicker",180,0,Kickerdir2Balldir),
	Receiver = task.GotoPos("Receiver", -200,0,0),
	Goalie   = task.Goalie()
},

["GetBall"] = {
	switch = function()
		if CBall2RoleDist("Receiver")<30 and Cbuf_cnt(true, 60) then
			return "PassBall"
		end
	end,
	Kicker   = task.GotoPos("Kicker",181,1,Kickerdir2Balldir),
	Receiver = task.ReceiverTask("mygetball7"),
	Goalie   = task.Goalie()
},

["PassBall"] = {
	switch = function()
		if CIsBallKick("Receiver") then
			return "Receive"
		end
	end,
	Kicker   = task.GotoPos("Kicker",180,0,Kickerdir2Balldir),
	-- Receiver = task.ReceiverTask("passballour"),
	Receiver = task.PassBall("Receiver","Kicker"),
	Goalie   = task.Goalie()
},

["Receive"] = {
	switch = function()
		if CIsGetBall("Kicker") then
			return "Shoot"
		end
	end,
	Kicker   = task.ReceiveBall("Kicker"),
	Receiver = task.GotoPos("Receiver", -200, 0,0),
	Goalie   = task.Goalie()
},

["Shoot"] = {
	switch = function()
		if CIsBallKick("Kicker") then
			return "Finish"
		end
	end,
	Kicker  = task.KickerTask("myshoot2"),
	Receiver = task.RobotHalt("Receiver"),
	Goalie = task.Goalie()
},

["Finish"] ={
	switch = function()
		if Cbuf_cnt(true,120) then
			return "Finish"
		end
	end,
	Kicker  = task.RobotHalt("Kicker"),
	Receiver = task.RobotHalt("Receiver"),
	Goalie = task.Goalie()
	
},
name = "backnoDrrble"
}
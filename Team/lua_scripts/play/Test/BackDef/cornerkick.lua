--desc: 
local Receiverdir2Balldir = function()
	return CRole2BallDir("Receiver")
end

gPlayTable.CreatePlay{
firstState = "Start",

 ["Start"] = {
 	switch = function()
 		if  CGetBallY() > 0 then
 			return "PassBall_L"
 		else
 			return "PassBall_R"
 		end
 	end,
 	Receiver   = task.GotoPos("Receiver",100,0,Receiverdir2Balldir),
	Kicker  = task.RobotHalt("Kicker"),
	Goalie   = task.Goalie()
 },


["PassBall_L"] = {
	switch = function()
		if CIsBallKick("Kicker")  then
			return "Receive"
		end
	end,
	Receiver = task.GotoPos("Receiver",100,-50,Receiverdir2Balldir),
	Kicker   = task.KickerTask("mypassballpower20"),
	Goalie   = task.Goalie()
},

["PassBall_R"] = {
	switch = function()
		if CIsBallKick("Kicker")  then
			return "Receive"
		end
	end,
	Receiver = task.GotoPos("Receiver",100,50,Receiverdir2Balldir),
	Kicker   = task.KickerTask("mypassballpower20"),
	Goalie   = task.Goalie()
},

["Receive"] = {
	switch = function()
		if  CBall2RoleDist("Receiver") < 50 and Cbuf_cnt(true,40) then
			return "Shoot"
		end
	end,
	Receiver = task.ReceiverTask("myreceiver"),
	Kicker  = task.RobotHalt("Kicker"),
	Goalie   = task.Goalie()
},

["Shoot"] = {
	switch = function()
		if CIsBallKick("Receiver") then
			return "Finish"
		end
	end,
	Receiver  = task.ReceiverTask("myshoot"),
	Kicker = task.RobotHalt("Kicker"),
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
name = "cornerkick"
}
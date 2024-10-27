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
 	Receiver  = task.GotoPos("Receiver",120,0,Receiverdir2Balldir),
	Kicker    = task.RobotHalt("Kicker"),
	Goalie    = task.Goalie()
 },


["PassBall_L"] = {
	switch = function()
		if CIsBallKick("Kicker")  then
			return "Receive"
		end
	end,
	Receiver = task.GotoPos("Receiver",120,-70,Receiverdir2Balldir),
	Kicker   = task.KickerTask("mypassball"),
	Goalie   = task.Goalie()
},

["PassBall_R"] = {
	switch = function()
		if CIsBallKick("Kicker")  then
			return "Receive"
		end
	end,
	Receiver = task.GotoPos("Receiver",120,70,Receiverdir2Balldir),
	Kicker   = task.KickerTask("mypassball"),
	Goalie   = task.Goalie()
},

["Receive"] = {
	switch = function()
		if  CBall2RoleDist("Receiver") < 40 and Cbuf_cnt(true,40) then
			return "Shoot"
		end
	end,
	Receiver = task.ReceiverTask("myreceiver"),
	Kicker = task.GotoPos("Kicker",-70,0,0),
	Goalie   = task.Goalie()
},

["Shoot"] = {
	switch = function()
		if CIsBallKick("Receiver")  then
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
name = "frontkick"
}
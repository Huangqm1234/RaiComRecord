--desc: 
local Kickerdir2Balldir = function()
	return CRole2BallDir("Kicker")
end
local yy = function ( )
	if CGetBallY() > 0 
	then
		yy = 50
	else
		yy = -50
	end
end

gPlayTable.CreatePlay{
firstState = "Start",

["Start"] = {
	switch = function()
		if CRole2TargetDist("Receiver")<10 and Cbuf_cnt(true, 120) then
			return "GetBall"
		end
	end,
	Kicker = task.GotoPos("Kicker", 200,-20,Kickerdir2Balldir),
	-- Kicker = task.GoRecePos("Kicker"),
	--Kicker   = task.GoRecePos("Kicker"),
	Receiver = task.GotoPos("Receiver", 150, yy,0),
	
	
	-- Receiver = task.ReceiverTask("mygetball"),
	Goalie   = task.Goalie()
},

["GetBall"] = {
	switch = function()
		if CRole2TargetDist("Receiver")<10 and Cbuf_cnt(true, 120) then
			return "PassBall"
		end
	end,
	Receiver = task.ReceiverTask("mygetball"),
	Goalie   = task.Goalie()
},

["PassBall"] = {
	switch = function()
		if CIsBallKick("Receiver") then
			return "Receive"
		end
	end,
	Receiver = task.ReceiverTask("passballourCorner"),
	Kicker   = task.KickerTask("receiveBall"),
	-- Receiver = task.PassBall("Receiver", "Kicker"),
	Goalie   = task.Goalie()
},

["Receive"] = {
	switch = function()
		if CRole2TargetDist("Kicker")<10 and Cbuf_cnt(true, 120)then
			return "Shoot"
		end
	end,
	Kicker   = task.KickerTask("gorecepos"),
	-- Receiver = task.PassBall("Receiver", "Kicker"),
	Goalie   = task.Goalie()
},

["Shoot"] = {
	switch = function()
		if CIsBallKick("Kicker") then
			return "Finish"
		end
	end,
	Kicker  = task.KickerTask("myshoot2"),
	Goalie = task.Goalie()
},

["Finish"] ={
	switch = function()
		-- if Cbuf_cnt(true,120) then
		-- 	return "Finish"
		-- end
	end,
	Kicker  = task.RobotHalt("Kicker"),
	Receiver = task.RobotHalt("Receiver"),
	Goalie = task.Goalie()
},

name = "normalcornerkick"
}
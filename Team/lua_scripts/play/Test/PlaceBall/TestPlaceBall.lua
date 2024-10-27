--desc: 
gPlayTable.CreatePlay{
firstState = "ready",

--["GetBall"] = {
--	Kicker   = task.GotoPos("Kicker", 0, 0, 0),
--	Receiver = task.GotoPos("Receiver", 0, 0, 0),
--	Goalie   = task.GotoPos("Goalie", -200,0,180)
--},
	
["ready"] = {
	switch = function()
		if Cbuf_cnt(true, 360) then
			return "pass"
		end
	end,
	Kicker   = task.GetBall("Kicker", "Receiver"),
	Receiver = task.ReceiverTask("receiveBall"),
	Goalie   = task.GotoPos("Goalie", -200,0,180)
},

["pass"] = {
	switch = function()
		if Cbuf_cnt(true, 180) then
			return "leave"
		end
	end,
	Kicker   = task.KickerTask("passBall"),
	Receiver = task.ReceiverTask("receiveBall"),
	Goalie   = task.GotoPos("Goalie", -200,0,180)
},

["leave"] = {

	Kicker   = task.GotoPos("Kicker", 0, 0, 0),
	Receiver = task.ReceiverTask("leave"),
	Goalie   = task.GotoPos("Goalie", -200,0,180)
},
name = "TestPlaceBall"
}
kickerdir = function()
	return CRole2BallDir("Kicker")
end

ReceiverDir = function()
	return CRole2BallDir("Receiver")
end

oppGoalDir = function()
	return CRole2OppGoalDir("Receiver")
end

gPlayTable.CreatePlay{

firstState = "start",
	
["start"] = {
	switch = function ()
		if CNormalStart() then
			return "KickOff"
		elseif CGameOn() then
			return "finish"
		end
	end,
	Kicker = task.GotoPos("Kicker",-50,0,kickerdir),
	Receiver = task.GotoPos("Receiver",0,50,ReceiverDir),
	Goalie = task.Goalie()
},

["KickOff"] = {
	switch = function()
		if CGameOn() then
			return "finish"
		elseif CIsGetBall("Kicker") then
			return "passball"
		end
	end,
	Kicker = task.GetBall("Kicker","Receiver"),
	Receiver = task.GotoPos("Receiver",0,50,ReceiverDir),
	Goalie = task.Goalie()
},

["passball"] = {
	switch = function()
		if CIsBallKick("Kicker") then
			return "Shoot"
		end
	end,
	Kicker = task.PassBall("Kicker","Receiver"),
	Receiver = task.GotoPos("Receiver",0,50,ReceiverDir),
	Goalie = task.Goalie()
},

["Shoot"] = {
	switch = function()
		if CIsBallKick("Receiver")then
			return "finish"
		end
	end,
	Kicker = task.Stop("Kicker",1),
	Receiver = task.Shoot("Receiver"),
	Goalie = task.Goalie()
},

name = "Ref_KickOff"
}
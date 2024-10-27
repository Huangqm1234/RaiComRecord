--desc: 
gPlayTable.CreatePlay{
firstState = "GetBall",

--["GetBall"] = {
--	Kicker   = task.GotoPos("Kicker", 0, 0, 0),
--	Receiver = task.GotoPos("Receiver", 0, 0, 0),
--	Goalie   = task.GotoPos("Goalie", -200,0,180)
--},
	
["GetBall"] = {
	Kicker   = task.KickerTask("placeBall"),
	Receiver = task.GotoPos("Receiver", 0, 0, 0),
	Goalie   = task.GotoPos("Goalie", -200,0,180)
},
name = "Ref_PlaceBall"
}
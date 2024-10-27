kickerdir = function()
	return CRole2BallDir("Kicker")
end

ReceiverDir = function()
	return CRole2BallDir("Receiver")
end

gPlayTable.CreatePlay{
firstState = "PenaltyDef",

["PenaltyDef"] = {
	switch = function()
		return "PenaltyDef"
	end,
	Kicker   = task.GotoPos("Kicker",-230,80,kickerdir),
	Receiver = task.GotoPos("Receiver",-230,-80,ReceiverDir),
	Goalie   = task.PenaltyDef()
},

name = "Ref_PenaltyDef"
}